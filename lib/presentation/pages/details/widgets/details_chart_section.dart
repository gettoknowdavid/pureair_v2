import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/app_container.dart';

BarTouchData _barTouchData = BarTouchData(
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
);

AxisTitles _bottomTitles = AxisTitles(
  sideTitles: SideTitles(
    showTitles: true,
    getTitlesWidget: (double value, TitleMeta meta) {
      String text;
      switch (value) {
        case 0.0:
          text = '10:00';
          break;
        case 1.0:
          text = '12:00';
          break;
        case 2.0:
          text = 'Now';
          break;
        default:
          text = '';
          break;
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: value == 2.0 ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      );
    },
  ),
);

final _dataList = [
  const _BarData(kTertiary, 50),
  const _BarData(kSecondary, 80),
  const _BarData(kPrimary, 30),
];

class DetailsChartSection extends StatelessWidget {
  const DetailsChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppContainer(
      padding: const EdgeInsets.fromLTRB(18, 40, 18, 18),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: BarChart(
          BarChartData(
            maxY: 500,
            borderData: FlBorderData(show: false),
            barTouchData: _barTouchData,
            gridData: FlGridData(show: false),
            alignment: BarChartAlignment.spaceAround,
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(),
              rightTitles: AxisTitles(),
              bottomTitles: _bottomTitles,
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
                          color: textTheme.labelSmall?.color?.withOpacity(0.6),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            barGroups: _dataList.asMap().entries.map((e) {
              return BarChartGroupData(
                x: e.key,
                showingTooltipIndicators: [0],
                barRods: [
                  BarChartRodData(
                    toY: e.value.value,
                    color: e.value.color,
                    width: 50,
                    borderRadius: BorderRadius.zero,
                    borderSide: const BorderSide(width: 1.5),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _BarData {
  final Color color;
  final double value;

  const _BarData(this.color, this.value);
}
