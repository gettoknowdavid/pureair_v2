import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pureair_v2/src/constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/common.dart';
import '../../../../utils/utils.dart';
import '../../domain/entities/entities.dart';
import 'details_section_title.dart';

class ForecastWidget extends StatelessWidget {
  final Forecast forecast;
  const ForecastWidget({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final daily = forecast.daily;

    final dictionary = {'o3': daily.o3, 'pm10': daily.pm10, 'pm25': daily.pm25};

    List<Widget> parameters = [];

    for (var item in dictionary.entries) {
      parameters.add(
        _ForecastParameter(
          parameterName: item.key.toUpperCase(),
          data: item.value,
        ),
      );
    }

    return AppContainer(
      padding: kVerticalPadding18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailsSectionTitle(
            title: 'Forecast Data',
            subtitle: getDateRange(daily.o3!.first!.day!, daily.o3!.last!.day!),
          ),
          const AppDivider(height: 50, endIndent: 18, indent: 18),
          ...parameters,
        ],
      ),
    );
  }
}

class _ForecastParameter extends StatelessWidget {
  const _ForecastParameter({required this.parameterName, required this.data});

  final String parameterName;
  final List<ForecastData?>? data;

  @override
  Widget build(BuildContext context) {
    final theFormat = DateFormat('YY-MM-DD');

    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: kHorizontalPadding18,
          child: Text(
            parameterName,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        5.verticalSpace,
        TableCalendar(
          focusedDay: DateTime.now(),
          currentDay: DateTime.now(),
          firstDay: data!.first!.day!,
          lastDay: data!.last!.day!,
          calendarFormat: CalendarFormat.week,
          headerVisible: false,
          rowHeight: 26,
          calendarBuilders: CalendarBuilders(
            prioritizedBuilder: (context, day, focusedDay) {
              final forecastData = data?.firstWhere(
                (e) => theFormat.format(e!.day!) == theFormat.format(day),
                orElse: () => null,
              );

              if (forecastData == null) {
                return const Text("-");
              } else {
                return Text("${forecastData.avg}");
              }
            },
          ),
          calendarStyle: CalendarStyle(
            isTodayHighlighted: false,
            outsideDaysVisible: false,
            canMarkersOverflow: false,
            cellMargin: EdgeInsets.zero,
            tablePadding: const EdgeInsets.symmetric(horizontal: 8),
            defaultTextStyle: textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        25.verticalSpace,
      ],
    );
  }
}
