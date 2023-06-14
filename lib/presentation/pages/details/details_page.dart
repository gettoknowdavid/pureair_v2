import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/pages/home/widgets/air_quality_card.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

import 'widgets/details_chart_section.dart';
import 'widgets/details_section_title.dart';

@RoutePage(deferredLoading: true)
class DetailsPage extends StatelessWidget {
  final AirQuality airQuality;
  const DetailsPage({super.key, required this.airQuality});

  @override
  Widget build(BuildContext context) {
    final coordinates = airQuality.coordinates;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView(
        padding: kHorizontalPadding18,
        child: Column(
          children: [
            10.verticalSpace,
            Hero(
              tag: "${coordinates.lat}-${coordinates.lon}",
              child: Material(
                child: AirQualityCard(
                  showDetail: true,
                  airQuality: airQuality,
                ),
              ),
            ),
            20.verticalSpace,
            const _UpcomingDaysSection(),
            20.verticalSpace,
            const DetailsChartSection(),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _UpcomingDaysSection extends StatelessWidget {
  const _UpcomingDaysSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppContainer(
      padding: kVerticalPadding18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DetailsSectionTitle(
            title: 'Upcoming Days',
            subtitle: '24-25 Nov 2023',
          ),
          const AppDivider(height: 50, endIndent: 18, indent: 18),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2025, 06, 10),
            calendarFormat: CalendarFormat.week,
            headerVisible: false,
            rowHeight: 35,
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
        ],
      ),
    );
  }
}
