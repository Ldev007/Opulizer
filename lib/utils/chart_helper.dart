import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:opulizer/utils/constants.dart';
import 'package:opulizer/view/theme/chart_theme.dart';
import 'package:intl/intl.dart';

class ChartHelper {
  static LineTouchData getLineTouchData({
    required List<LineTooltipItem?> Function(List<LineBarSpot>) getTooltipItems,
    required double minX,
    required double maxX,
    required ChartTheme chartTheme,
  }) =>
      LineTouchData(
        enabled: true,
        handleBuiltInTouches: true,
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map(
            (spotIndex) {
              if (barData.spots[spotIndex].x >= minX &&
                  barData.spots[spotIndex].y <= maxX) {
                return TouchedSpotIndicatorData(
                  FlLine(
                    color: chartTheme.spotIndicatorLineColor!,
                    strokeWidth: 1,
                    dashArray: [2, 2],
                  ),
                  FlDotData(
                    getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                      radius: 5,
                      color: chartTheme.spotIndicatorDotColor!,
                      strokeColor: chartTheme.spotIndicatorDotStrokeColor!,
                      strokeWidth: 1.5,
                    ),
                  ),
                );
              }
            },
          ).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          getTooltipItems: getTooltipItems,
          tooltipRoundedRadius: 8,
          getTooltipColor: (spot) => chartTheme.chartTooltipBackgroundColor!,
          tooltipBorder: BorderSide(color: chartTheme.chartTooltipBorderColor!),
        ),
      );

  static FlBorderData getBorderData({required ChartTheme chartTheme}) =>
      FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(
            color: chartTheme.chartBorderColor!,
          ),
          bottom: BorderSide(
            color: chartTheme.chartBorderColor!,
          ),
        ),
      );

  static FlDotData getDotData({
    Color Function(int)? operation,
    required ChartTheme chartTheme,
  }) =>
      FlDotData(
        getDotPainter: (spot, p1, chartBarData, spotIndex) {
          Color? strokeColor = operation?.call(spotIndex);

          return FlDotCirclePainter(
            color: chartTheme.dotColor!,
            radius: 2,
            strokeColor: strokeColor!,
            strokeWidth: 2,
          );
        },
      );

  static Widget getTitleWidget({
    required AxisSide side,
    dynamic title,
    required double defaultThemeLabelFontSize,
    required ChartTheme chartTheme,
  }) {
    switch (side) {
      case AxisSide.bottom:
        return Column(
          children: [
            title != null
                ? Text(
                    '|',
                    style: TextStyle(
                      color: chartTheme.chartTitleTextColor!,
                      fontSize: defaultThemeLabelFontSize * 0.7,
                    ),
                  )
                : const SizedBox(),
            Text(
              title?.substring(0, 5) ?? '',
              style: TextStyle(
                color: chartTheme.chartTitleTextColor!,
                fontSize: defaultThemeLabelFontSize * 0.7,
              ),
            ),
          ],
        );
      case AxisSide.left:
        return Text(
          title.toInt().toString(),
          style: TextStyle(
            color: chartTheme.chartTitleTextColor!,
            fontSize: defaultThemeLabelFontSize * 0.7,
          ),
        );
      default:
        return const SizedBox();
    }
  }

  static Text getAxisNameWidget({
    required double defaultThemeTextLabelFontSize,
    required AxisSide side,
    required ChartTheme chartTheme,
  }) {
    switch (side) {
      case AxisSide.bottom:
        return Text(
          Constants.bottomAxisLabel,
          style: TextStyle(
            color: chartTheme.axisNameTextColor!,
            fontSize: defaultThemeTextLabelFontSize * 0.6,
          ),
        );
      case AxisSide.left:
        return Text(
          Constants.leftAxisLabel,
          style: TextStyle(
            color: chartTheme.axisNameTextColor!,
            fontSize: defaultThemeTextLabelFontSize * 0.6,
          ),
        );
      default:
        return const Text('');
    }
  }

  static LineTooltipItem getLineTooltipItem({
    required String time,
    required String probability,
    required String opinion,
    required double defaultThemeLabelFontSize,
    required ChartTheme chartTheme,
  }) =>
      LineTooltipItem(
        'Time: $time\n',
        textAlign: TextAlign.left,
        children: [
          TextSpan(
            text: 'Probability: $probability\n',
            children: [
              TextSpan(
                text: 'Opinion: ${opinion.toUpperCase()}',
              ),
            ],
          ),
        ],
        TextStyle(
          color: chartTheme.chartTooltipTextColor!,
          fontSize: defaultThemeLabelFontSize * 0.7,
        ),
      );

  static getFormattedTime({
    required DateFormat format,
    required double unformattedValue,
  }) =>
      format.format(
        DateTime.fromMillisecondsSinceEpoch(
          (unformattedValue * 1000).toInt(),
        ),
      );
}
