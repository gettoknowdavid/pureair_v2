import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'widgets/index.dart';

@RoutePage(deferredLoading: true)
class DetailsPage extends HookWidget {
  final bool showActions;
  final List<double>? geo;

  const DetailsPage({
    super.key,
    this.geo,
    this.showActions = true,
  });

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
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await context.read<SearchCubit>().loadDetails(geo!).then((value) {
          aq.value = value!;
          loading.value = false;
        });
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text('Details'),
        actions: showActions ? actions : null,
      ),
      body: SingleChildScrollView(
        padding: kHorizontalPadding18,
        child: Column(
          children: [
            10.verticalSpace,
            AppContainer(
              loading: loading.value,
              backgroundColor: colorScheme.background,
              child: Column(
                children: [
                  18.verticalSpace,
                  StationDetails(
                    loading: loading.value,
                    airQuality: aq.value,
                    height: smallContainerHeight,
                  ),
                  const AppDivider(height: 40, indent: 16, endIndent: 16),
                  WeatherSection(
                    measurements: aq.value?.measurements,
                    loading: loading.value,
                  ),
                  20.verticalSpace,
                  InfoSection(airQuality: aq.value, loading: loading.value),
                ],
              ),
            ),
            20.verticalSpace,
            HealthRecommendation(aqi: aq.value?.aqi, loading: loading.value),
            20.verticalSpace,
            PollutantsGrid(
              measurements: aq.value?.measurements,
              loading: loading.value,
            ),
            20.verticalSpace,
            if (!loading.value) ...[
              ForecastWidget(forecast: aq.value!.forecast),
              20.verticalSpace,
              DetailsChartSection(airQuality: aq.value!),
              50.verticalSpace,
            ],
          ],
        ),
      ),
    );
  }
}
