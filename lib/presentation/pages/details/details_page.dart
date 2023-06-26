import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'health_recommendation.dart';
import 'info_section.dart';
import 'pollutants_grid.dart';
import 'station_details.dart';
import 'widgets/details_chart_section.dart';
import 'widgets/forecast_widget.dart';

@RoutePage(deferredLoading: true)
class DetailsPage extends HookWidget {
  final AirQuality? airQuality;
  final List<double>? geo;
  const DetailsPage({
    super.key,
    this.airQuality,
    this.geo,
  }) : assert(!(airQuality != null && geo != null));

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final size = MediaQuery.sizeOf(context);
    final smallContainerHeight = (size.height * 0.25) * 0.3;

    final loading = useState<bool>(true);
    final aq = useState<AirQuality?>(null);

    List<Widget> actions = [
      SizedBox(
        height: kToolbarHeight * 0.6,
        child: DetailsAddButton(
          onPressed: () {
            final updatedCity = aq.value!.city.copyWith(isLocal: false);
            context.read<AirQualityCubit>().addCity(updatedCity);
            context.router.popUntilRoot();
          },
        ),
      ),
      18.horizontalSpace,
    ];

    useEffect(() {
      if (airQuality != null) {
        aq.value = airQuality!;
        loading.value = false;
      } else {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await context.read<SearchCubit>().loadDetails(geo!).then((value) {
            aq.value = value!;
            loading.value = false;
          });
        });
      }
      return null;
    }, []);

    if (loading.value) {
      return const Scaffold(body: Loading());
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text('Detail'),
        actions: geo == null ? null : actions,
      ),
      body: SingleChildScrollView(
        padding: kHorizontalPadding18,
        child: Column(
          children: [
            10.verticalSpace,
            AppContainer(
              backgroundColor: colorScheme.background,
              child: Column(
                children: [
                  18.verticalSpace,
                  StationDetails(
                    airQuality: aq.value!,
                    height: smallContainerHeight,
                  ),
                  const AppDivider(height: 40, indent: 16, endIndent: 16),
                  WeatherSection(aq.value!.measurements),
                  20.verticalSpace,
                  InfoSection(airQuality: aq.value!),
                ],
              ),
            ),
            20.verticalSpace,
            HealthRecommendation(aqi: aq.value!.aqi),
            20.verticalSpace,
            PollutantsGrid(measurements: aq.value!.measurements),
            20.verticalSpace,
            ForecastWidget(forecast: aq.value!.forecast),
            20.verticalSpace,
            DetailsChartSection(airQuality: aq.value!),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
