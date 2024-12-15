import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

class ForecastWidget extends ConsumerWidget {
  const ForecastWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsNotifierProvider);
    return state.when(
      data: (airQuality) => _ForecastWidgetView(forecast: airQuality!.forecast),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const Skeletonizer(
        child: _ForecastWidgetView(forecast: fakeForecast),
      ),
    );
  }
}

class _ForecastWidgetView extends StatelessWidget {
  const _ForecastWidgetView({required this.forecast});
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final dictionary = {
      'o3': forecast.data.o3,
      'pm10': forecast.data.pm10,
      'pm25': forecast.data.pm25,
      'uvi': forecast.data.uvi,
    };

    final firstDate = forecast.data.o3?.first.day ?? DateTime(1990);
    final lastDate = forecast.data.o3?.last.day ?? DateTime.now();

    final parameters = <Widget>[];

    for (final item in dictionary.entries) {
      parameters.add(
        _ForecastParameter(
          parameterName: item.key.toUpperCase(),
          data: item.value,
        ),
      );
    }

    return PContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: kHorizontalPadding24,
            child: DetailsSectionTitle(
              title: 'Forecast Data',
              subtitle: getDateRange(firstDate, lastDate),
            ),
          ),
          const PDivider(height: 50, endIndent: 18, indent: 18),
          ...parameters,
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ForecastParameter extends StatelessWidget {
  const _ForecastParameter({required this.parameterName, required this.data});

  final String parameterName;
  final List<DailyForecast>? data;

  @override
  Widget build(BuildContext context) {
    final dayFormatter = DateFormat('yyyy-MM-dd');
    final textTheme = PureAirTextTheme.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: kHorizontalPadding24,
          child: Text(parameterName, style: textTheme.bodyBold),
        ),
        const SizedBox(height: 5),
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: data?.first.day ?? DateTime(1990),
          lastDay: data?.last.day ?? DateTime.now(),
          calendarFormat: CalendarFormat.week,
          headerVisible: false,
          rowHeight: 26,
          calendarBuilders: CalendarBuilders<dynamic>(
            prioritizedBuilder: (context, day, focusedDay) {
              final forecastData = data?.firstWhere(
                (e) {
                  final curDay = dayFormatter.format(e.day ?? DateTime.now());
                  final calDay = dayFormatter.format(day);
                  return curDay == calDay;
                },
                orElse: () => DailyForecast(day: day),
              );
              if (forecastData == null) return const Text('-');
              return Text('${forecastData.avg}');
            },
          ),
          calendarStyle: CalendarStyle(
            isTodayHighlighted: false,
            outsideDaysVisible: false,
            canMarkersOverflow: false,
            cellMargin: EdgeInsets.zero,
            tablePadding: const EdgeInsets.symmetric(horizontal: 12),
            defaultTextStyle: textTheme.captionBold!,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
