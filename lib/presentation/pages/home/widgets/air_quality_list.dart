import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/src/material/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/heroes.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:provider/src/provider.dart';
import 'package:pureair_v2/application/air_quality_bloc/air_quality_bloc.dart';
import 'package:pureair_v2/config/router/app_router.gr.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/presentation/pages/home/widgets/air_quality_card.dart';

class AirQualityList extends StatelessWidget {
  const AirQualityList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AirQualityBloc>();

    return BlocBuilder<AirQualityBloc, AirQualityState>(
      bloc: bloc,
      buildWhen: (p, c) => p.airQualityList != c.airQualityList,
      builder: (context, state) {
        if (bloc.state.airQualityList.isEmpty) {
          return const SizedBox();
        }

        final length = bloc.state.airQualityList.length;

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: length,
          separatorBuilder: (context, index) => 20.verticalSpace,
          itemBuilder: (context, index) {
            final airQuality = bloc.state.airQualityList[index]!;
            final coordinates = airQuality.coordinates;

            return Hero(
              tag: "${coordinates.lat}-${coordinates.lon}",
              child: Material(
                child: AirQualityCard(
                  airQuality: airQuality,
                  onTap: () {
                    context.router.push(DetailsRoute(airQuality: airQuality));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
