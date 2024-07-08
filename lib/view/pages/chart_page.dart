import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opulizer/controller/backend_controller.dart';
import 'package:opulizer/model/domain/price_record_snapshot.dart';
import 'package:opulizer/model/providers/chart_page_provider.dart';
import 'package:opulizer/model/providers/ip_address_provider.dart';
import 'package:opulizer/utils/chart_helper.dart';
import 'package:opulizer/utils/constants.dart';
import 'package:opulizer/view/theme/chart_theme.dart';
import 'package:opulizer/view/widgets/chart_card.dart';
import 'package:opulizer/view/widgets/chart_guides.dart';
import 'package:intl/intl.dart' as intl;

class ChartPage extends ConsumerWidget {
  ChartPage({super.key});

  final intl.DateFormat timeFormat = intl.DateFormat('hh:mm a');
  final GlobalKey<TooltipState> stopTooltipKey = GlobalKey<TooltipState>();
  final GlobalKey<TooltipState> startTooltipKey = GlobalKey<TooltipState>();
  final TextEditingController ipEditingController = TextEditingController();
  final SnackBar _invalidIpSnackBar = const SnackBar(
    content: Text(Constants.enterValidIpMessage),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenDimensions = MediaQuery.of(context).size;
    final chartTheme = Theme.of(context).extension<ChartTheme>()!;
    final currentDateTime = DateTime.now();
    final minX = DateTime(
          currentDateTime.year,
          currentDateTime.month,
          currentDateTime.day,
          currentDateTime.hour,
          currentDateTime.minute,
          currentDateTime.second,
        ).millisecondsSinceEpoch /
        1000;
    final maxX = DateTime(currentDateTime.year, currentDateTime.month,
                currentDateTime.day, currentDateTime.hour + 5, 59, 59)
            .millisecondsSinceEpoch /
        1000;

    final defaultTextThemeLabelFontSize =
        Theme.of(context).textTheme.labelSmall!.fontSize!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Constants.appName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Tooltip(
              key: startTooltipKey,
              message: Constants.startTooltipMessage,
              child: FloatingActionButton(
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        title: Text(
                          Constants.ipInputDialogTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: AspectRatio(
                          aspectRatio: 1.5,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: TextField(
                                    controller: ipEditingController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText:
                                          Constants.ipInputTextFieldLabel,
                                    ),
                                  ),
                                ),
                              ),
                              FilledButton(
                                onPressed: () {
                                  if (ipEditingController.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(_invalidIpSnackBar);
                                    return;
                                  }
                                  ref.read(ipAddressProvider.notifier).ip =
                                      ipEditingController.text;
                                  Navigator.pop(context);
                                },
                                child: const Text(Constants.submitButtonLabel),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).then(
                    (_) {
                      if (ref.read(ipAddressProvider).isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(_invalidIpSnackBar);
                        return;
                      }
                      ref
                          .read(backendControllerProvider.notifier)
                          .initiateBackendPopulation();
                    },
                  );
                },
                // Uncomment the below code to test server's connection with the frontend if it is working
                // then the UI will load fine with a short glimpse of the loading indicator otherwise it will get stuck on the loading indicator

                // onPressed: () =>
                //     ref.read(backendControllerProvider.notifier).testServer(),
                child: const Icon(Icons.play_arrow),
              ),
            ),
            Constants.verticalSpacerBox,
            Tooltip(
              key: stopTooltipKey,
              message: Constants.stopTooltipMessage,
              child: FloatingActionButton(
                onPressed: () {
                  if (ref.read(ipAddressProvider).isEmpty) {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog.adaptive(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          title: Icon(Icons.warning),
                          content: Text(Constants.invalidStopTapMessage),
                        );
                      },
                    ).then(
                      (_) => ref
                          .read(backendControllerProvider.notifier)
                          .terminateBackendPopulation(),
                    );
                  }
                },
                child: const Icon(Icons.stop),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: switch (ref.watch(backendControllerProvider)) {
            AsyncData<bool>(:final value) => value
                ? StreamBuilder<PriceRecordSnapshot?>(
                    stream: ref.read(chartPageProvider).value,
                    builder: (ctx, snaps) {
                      if (snaps.hasData &&
                          snaps.data!.priceRecords.isNotEmpty) {
                        return Stack(
                          children: [
                            Align(
                              alignment: const Alignment(0, 0),
                              child: AspectRatio(
                                aspectRatio: 1.45,
                                child: ChartCard(
                                  child: LineChart(
                                    LineChartData(
                                      minY: 0,
                                      maxY: 100,
                                      minX: minX,
                                      maxX: maxX,
                                      lineTouchData:
                                          ChartHelper.getLineTouchData(
                                        chartTheme: chartTheme,
                                        getTooltipItems: (touchedSpots) =>
                                            touchedSpots.map(
                                          (spot) {
                                            if (spot.x >= minX &&
                                                spot.y <= maxX) {
                                              return ChartHelper
                                                  .getLineTooltipItem(
                                                chartTheme: chartTheme,
                                                time: timeFormat.format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        (spot.x * 1000)
                                                            .toInt())),
                                                probability:
                                                    '${spot.y.toStringAsFixed(2)}%',
                                                opinion:
                                                    ' ${snaps.data!.priceRecords.where((testRecord) => testRecord.probability == spot.y && (testRecord.timestamp.millisecondsSinceEpoch / 1000) == spot.x).first.opinion}',
                                                defaultThemeLabelFontSize:
                                                    defaultTextThemeLabelFontSize,
                                              );
                                            }
                                          },
                                        ).toList(),
                                        minX: minX,
                                        maxX: maxX,
                                      ),
                                      clipData: const FlClipData.all(),
                                      gridData: const FlGridData(show: false),
                                      borderData: ChartHelper.getBorderData(
                                        chartTheme: chartTheme,
                                      ),
                                      lineBarsData: [
                                        LineChartBarData(
                                          gradient:
                                              chartTheme.chartLineColorGradient,
                                          spots: snaps.data!.priceRecords
                                              .map((snap) => FlSpot(
                                                    snap.timestamp
                                                            .millisecondsSinceEpoch /
                                                        1000,
                                                    snap.probability.toDouble(),
                                                  ))
                                              .toList(),
                                          dotData: ChartHelper.getDotData(
                                              chartTheme: chartTheme,
                                              operation: (spotIndex) {
                                                if (snaps
                                                        .data!
                                                        .priceRecords[spotIndex]
                                                        .opinion ==
                                                    Constants
                                                        .yesOpinionGuideLabel) {
                                                  return chartTheme
                                                      .dotStrokeColorForYesOpinion!;
                                                } else {
                                                  return chartTheme
                                                      .dotStrokeColorForNoOpinion!;
                                                }
                                              }),
                                        ),
                                      ],
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: AxisTitles(
                                          axisNameSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          axisNameWidget:
                                              ChartHelper.getAxisNameWidget(
                                            chartTheme: chartTheme,
                                            defaultThemeTextLabelFontSize:
                                                defaultTextThemeLabelFontSize,
                                            side: AxisSide.bottom,
                                          ),
                                          sideTitles: SideTitles(
                                            interval: (3600000 / 1000) * 1,
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              String? title;
                                              if (value != minX &&
                                                  value != maxX) {
                                                title = ChartHelper
                                                    .getFormattedTime(
                                                  format: timeFormat,
                                                  unformattedValue: value,
                                                );
                                              }
                                              return ChartHelper.getTitleWidget(
                                                chartTheme: chartTheme,
                                                title: title,
                                                defaultThemeLabelFontSize:
                                                    defaultTextThemeLabelFontSize,
                                                side: AxisSide.bottom,
                                              );
                                            },
                                          ),
                                        ),
                                        leftTitles: AxisTitles(
                                          axisNameWidget:
                                              ChartHelper.getAxisNameWidget(
                                            chartTheme: chartTheme,
                                            defaultThemeTextLabelFontSize:
                                                defaultTextThemeLabelFontSize,
                                            side: AxisSide.left,
                                          ),
                                          axisNameSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.06,
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            interval: 25,
                                            getTitlesWidget: (title, meta) =>
                                                ChartHelper.getTitleWidget(
                                              chartTheme: chartTheme,
                                              side: AxisSide.left,
                                              title: title,
                                              defaultThemeLabelFontSize:
                                                  defaultTextThemeLabelFontSize,
                                            ),
                                          ),
                                        ),
                                        topTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        rightTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(
                                0.8,
                                -0.25,
                              ),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const ChartGuides(
                                      opinion: Constants.yesOpinionGuideLabel,
                                    ),
                                    SizedBox(
                                      width: screenDimensions.width * 0.05,
                                    ),
                                    const ChartGuides(
                                      opinion: Constants.noOpinionGuideLabel,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (snaps.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child: GestureDetector(
                            onTap: () async {
                              startTooltipKey.currentState!
                                  .ensureTooltipVisible();
                              await Future.delayed(
                                const Duration(seconds: 3),
                                () {
                                  Tooltip.dismissAllToolTips();
                                  stopTooltipKey.currentState!
                                      .ensureTooltipVisible();
                                },
                              );

                              Future.delayed(
                                const Duration(seconds: 3),
                                () => Tooltip.dismissAllToolTips(),
                              );
                            },
                            child: const Text(
                              Constants.noDataToShowMessage,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                  )
                : const Center(
                    child: Text(Constants.unknownErrorMessage),
                  ),
            AsyncError() => const Center(
                child: Text(
                  Constants.checkInternetMessage,
                  textAlign: TextAlign.center,
                ),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              )
          },
        ),
      ),
    );
  }
}
