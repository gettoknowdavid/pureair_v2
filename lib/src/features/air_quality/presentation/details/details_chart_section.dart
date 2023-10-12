import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../../../common/common.dart';
import '../../../../utils/utils.dart';
import '../../domain/entities/entities.dart';
import 'details_section_title.dart';

final format = DateFormat('YY-MM-DD');
final today = format.format(DateTime.now());

class DetailsChartSection extends StatelessWidget {
  final AirQuality airQuality;
  const DetailsChartSection({super.key, required this.airQuality});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final daily = airQuality.forecast.daily;
    final o3 = daily.o3?.firstWhere((e) => format.format(e!.day!) == today);
    final pm10 = daily.pm10?.firstWhere((e) => format.format(e!.day!) == today);
    final pm25 = daily.pm25?.firstWhere((e) => format.format(e!.day!) == today);

    final dictionary = {"o3": o3, "pm10": pm10, "pm25": pm25};

    return AppContainer(
      padding: const EdgeInsets.symmetric(vertical: kGlobalPadding),
      child: Column(
        children: [
          DetailsSectionTitle(title: "Today's chart", subtitle: getDate()),
          const AppDivider(height: 50, endIndent: 18, indent: 18),
          AspectRatio(
            aspectRatio: 1.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
              child: BarChart(
                BarChartData(
                  maxY: 500,
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: EdgeInsets.zero,
                      tooltipMargin: 0,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.round().toString(),
                          const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          String text;
                          switch (value) {
                            case 0.0:
                              text = 'O3';
                              break;
                            case 1.0:
                              text = 'PM10';
                              break;
                            case 2.0:
                              text = 'PM25';
                              break;
                            default:
                              text = '';
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(text),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      drawBehindEverything: true,
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 0,
                            child: Text(
                              value.toInt().toString(),
                              textAlign: TextAlign.center,
                              style: textTheme.labelSmall?.copyWith(
                                color: textTheme.labelSmall?.color
                                    ?.withOpacity(0.6),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: dictionary.entries.map((e) {
                    return BarChartGroupData(
                      x: e.value!.avg!,
                      showingTooltipIndicators: [0],
                      barRods: [
                        BarChartRodData(
                          toY: e.value!.avg!.toDouble(),
                          color: getColorForParameter(e.key, e.value?.avg),
                          width: 50,
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            width: 1.5,
                            color: colorScheme.onBackground,
                          ),
                        )
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
