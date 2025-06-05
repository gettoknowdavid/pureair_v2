import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

final format = DateFormat('YY-MM-DD');
final String today = format.format(DateTime.now());

class DetailsChartWidget extends StatelessWidget {
  const DetailsChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DetailsCubit, DetailsState, Forecast?>(
      selector: (state) => switch (state) {
        DetailsLoadSuccess(:final airQuality) => airQuality.forecast,
        _ => null,
      },
      builder: (context, forecast) {
        if (forecast == null) return const SizedBox.shrink();
        return _DetailsChartView(forecast: forecast);
      },
    );
  }
}

class _DetailsChartView extends StatelessWidget {
  const _DetailsChartView({required this.forecast});
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = PureAirTextTheme.of(context)!;

    final daily = forecast.data;
    final o3 = daily.o3?.firstWhere((e) => format.format(e.day!) == today);
    final pm10 = daily.pm10?.firstWhere((e) => format.format(e.day!) == today);
    final pm25 = daily.pm25?.firstWhere((e) => format.format(e.day!) == today);

    final dictionary = {'o3': o3, 'pm10': pm10, 'pm25': pm25};

    return PContainer(
      padding: const EdgeInsets.symmetric(vertical: kGlobalPadding),
      child: Column(
        children: [
          Padding(
            padding: kHorizontalPadding24,
            child: DetailsSectionTitle(
              title: "Today's chart",
              subtitle: getDate(),
            ),
          ),
          const PDivider(height: 50, endIndent: 24, indent: 24),
          AspectRatio(
            aspectRatio: 1.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
              child: BarChart(
                BarChartData(
                  maxY: 500,
                  borderData: FlBorderData(show: false),
                  backgroundColor: Colors.transparent,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => Colors.transparent,
                      tooltipPadding: EdgeInsets.zero,
                      tooltipMargin: 0,
                      getTooltipItem: (_, gIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.round().toString(),
                          textTheme.tiny!,
                        );
                      },
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          String text;
                          if (value == (o3?.avg ?? 0)) {
                            text = 'O3';
                          } else if (value == (pm10?.avg ?? 0)) {
                            text = 'PM10';
                          } else if (value == (pm25?.avg ?? 0)) {
                            text = 'PM25';
                          } else {
                            text = '';
                          }
                          return SideTitleWidget(meta: meta, child: Text(text));
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => SideTitleWidget(
                          meta: meta,
                          space: 0,
                          child: Text(
                            value.toInt().toString(),
                            textAlign: TextAlign.center,
                            style: textTheme.tiny,
                          ),
                        ),
                      ),
                    ),
                  ),
                  barGroups: dictionary.entries.map((e) {
                    return BarChartGroupData(
                      x: e.value?.avg.toInt() ?? 0,
                      showingTooltipIndicators: [0],
                      barRods: [
                        BarChartRodData(
                          toY: e.value?.avg.toDouble() ?? 0,
                          color: getParameterColor(e.key, e.value?.avg),
                          width: 50,
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            width: 2,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
