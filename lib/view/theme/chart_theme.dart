import 'package:flutter/material.dart';

class ChartTheme extends ThemeExtension<ChartTheme> {
  final Color? titleTextColor;
  final LinearGradient? chartLineColorGradient;
  final Color? dotStrokeColorForYesOpinion;
  final Color? dotStrokeColorForNoOpinion;
  final Color? dotColor;

  final Color? chartTitleTextColor;
  final Color? axisNameTextColor;

  final Color? spotIndicatorLineColor;
  final Color? spotIndicatorDotColor;
  final Color? spotIndicatorDotStrokeColor;

  final Color? chartTooltipTextColor;
  final Color? chartTooltipBackgroundColor;
  final Color? chartTooltipBorderColor;
  final Color? chartBorderColor;

  @override
  ThemeExtension<ChartTheme> copyWith({
    Color? titleTextColor,
    LinearGradient? chartLineColorGradient,
    Color? dotStrokeColorForYesOpinion,
    Color? dotStrokeColorForNoOpinion,
    Color? dotColor,
    Color? chartTitleTextColor,
    Color? axisNameTextColor,
    Color? spotIndicatorLineColor,
    Color? spotIndicatorDotColor,
    Color? spotIndicatorDotStrokeColor,
    Color? chartTooltipTextColor,
    Color? chartTooltipBackgroundColor,
    Color? chartTooltipBorderColor,
    Color? chartBorderColor,
  }) =>
      ChartTheme(
        titleTextColor: titleTextColor ?? this.titleTextColor,
        chartLineColorGradient:
            chartLineColorGradient ?? this.chartLineColorGradient,
        dotStrokeColorForYesOpinion:
            dotStrokeColorForYesOpinion ?? this.dotStrokeColorForYesOpinion,
        dotStrokeColorForNoOpinion:
            dotStrokeColorForNoOpinion ?? this.dotStrokeColorForNoOpinion,
        dotColor: dotColor ?? this.dotColor,
        chartTitleTextColor: chartTitleTextColor ?? this.chartTitleTextColor,
        axisNameTextColor: axisNameTextColor ?? this.axisNameTextColor,
        spotIndicatorLineColor:
            spotIndicatorLineColor ?? this.spotIndicatorLineColor,
        spotIndicatorDotColor:
            spotIndicatorDotColor ?? this.spotIndicatorDotColor,
        spotIndicatorDotStrokeColor:
            spotIndicatorDotStrokeColor ?? this.spotIndicatorDotStrokeColor,
        chartTooltipTextColor:
            chartTooltipTextColor ?? this.chartTooltipTextColor,
        chartTooltipBackgroundColor:
            chartTooltipBackgroundColor ?? this.chartTooltipBackgroundColor,
        chartTooltipBorderColor:
            chartTooltipBorderColor ?? this.chartTooltipBorderColor,
        chartBorderColor: chartBorderColor ?? this.chartBorderColor,
      );

  ChartTheme({
    this.titleTextColor = Colors.grey,
    this.chartLineColorGradient = const LinearGradient(
      colors: [
        Colors.cyan,
        Color.fromARGB(255, 1, 69, 79),
      ],
    ),
    this.dotStrokeColorForYesOpinion = Colors.green,
    this.dotStrokeColorForNoOpinion = Colors.red,
    this.dotColor = Colors.white,
    this.chartTitleTextColor = Colors.grey,
    this.axisNameTextColor = Colors.grey,
    this.spotIndicatorLineColor = Colors.cyan,
    this.spotIndicatorDotColor = Colors.transparent,
    this.spotIndicatorDotStrokeColor = Colors.white,
    this.chartTooltipTextColor = Colors.white,
    this.chartTooltipBackgroundColor = Colors.black,
    this.chartTooltipBorderColor = const Color.fromARGB(255, 1, 69, 79),
    this.chartBorderColor = Colors.grey,
  });

  @override
  ThemeExtension<ChartTheme> lerp(ThemeExtension<ChartTheme>? other, double t) {
    if (other is! ChartTheme) {
      return this;
    }
    return ChartTheme(
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t),
      chartLineColorGradient: LinearGradient.lerp(
          chartLineColorGradient, other.chartLineColorGradient, t),
      dotStrokeColorForYesOpinion: Color.lerp(
          dotStrokeColorForYesOpinion, other.dotStrokeColorForYesOpinion, t),
      dotStrokeColorForNoOpinion: Color.lerp(
          dotStrokeColorForNoOpinion, other.dotStrokeColorForNoOpinion, t),
      dotColor: Color.lerp(dotColor, other.dotColor, t),
      chartTitleTextColor:
          Color.lerp(chartTitleTextColor, other.chartTitleTextColor, t),
      axisNameTextColor:
          Color.lerp(axisNameTextColor, other.axisNameTextColor, t),
      spotIndicatorLineColor:
          Color.lerp(spotIndicatorLineColor, other.spotIndicatorLineColor, t),
      spotIndicatorDotColor:
          Color.lerp(spotIndicatorDotColor, other.spotIndicatorDotColor, t),
      spotIndicatorDotStrokeColor: Color.lerp(
          spotIndicatorDotStrokeColor, other.spotIndicatorDotStrokeColor, t),
      chartTooltipTextColor:
          Color.lerp(chartTooltipTextColor, other.chartTooltipTextColor, t),
      chartTooltipBackgroundColor: Color.lerp(
          chartTooltipBackgroundColor, other.chartTooltipBackgroundColor, t),
      chartTooltipBorderColor:
          Color.lerp(chartTooltipBorderColor, other.chartTooltipBorderColor, t),
      chartBorderColor: Color.lerp(chartBorderColor, other.chartBorderColor, t),
    );
  }
}
