import 'package:auto_route/auto_route.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/injector/injector.dart';
import 'package:pureair_v2/presentation/pages/explore/widgets/aqi_marker.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'widgets/explore_search_field.dart';

const CameraPosition _kLake = CameraPosition(
  bearing: 192.8334901395799,
  target: LatLng(37.43296265331129, -122.08832357078792),
  tilt: 59.440717697143555,
  zoom: 19.151926040649414,
);

@RoutePage()
class ExplorePage extends StatefulHookWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late GoogleMapController _mapController;

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    di<MapCubit>().mapCompleter.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MapCubit>();

    final stations = useState<List<MapData?>>([]);
    const zoomPreference = MinMaxZoomPreference(5, 16);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await cubit.goToMyLocation();
      });
      return null;
    }, const []);

    Future<void> onCameraMove(position) async {
      stations.value = await cubit.getMapBounds(_mapController);
    }

    return BlocConsumer<MapCubit, MapState>(
      bloc: cubit,
      listener: (context, state) {},
      listenWhen: (p, c) => p.loading != c.loading,
      buildWhen: (p, c) => p.loading != c.loading,
      builder: (context, state) {
        if (cubit.state.loading) {
          return const Scaffold(body: Loading());
        }

        return Scaffold(body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Stack(
                children: [
                  AppContainer(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    margin: const EdgeInsets.fromLTRB(18, 26, 18, 18),
                    child: Stack(
                      children: [
                        CustomGoogleMapMarkerBuilder(
                          customMarkers: stations.value.map((e) {
                            return MarkerData(
                              marker: Marker(
                                markerId: MarkerId(e!.uid.toString()),
                                icon: BitmapDescriptor.defaultMarker,
                                position: LatLng(e.lat, e.lon),
                                infoWindow: InfoWindow(
                                  title: e.station.name,
                                  snippet: 'AQI: ${e.aqi}',
                                ),
                              ),
                              child: AqiMarker(aqi: e.aqi),
                            );
                          }).toList(),
                          builder: (context, markers) {
                            return GoogleMap(
                              onMapCreated: onMapCreated,
                              initialCameraPosition: _kLake,
                              onCameraMove: onCameraMove,
                              myLocationButtonEnabled: true,
                              myLocationEnabled: true,
                              padding: const EdgeInsets.all(0),
                              minMaxZoomPreference: zoomPreference,
                              markers: markers ?? {},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const ExploreSearchField(),
                ],
              ),
            );
          },
        ));
      },
    );
  }
}
