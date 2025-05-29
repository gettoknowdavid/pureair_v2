import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:osm_flutter_hooks/osm_flutter_hooks.dart';
import 'package:pureair_v2/src/features/explore/explore.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class ExplorePage extends HookWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Air Quality in the World')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;
          return SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Positioned(
                  height: height - kSearchBarHeight,
                  bottom: 24,
                  width: width - 48,
                  left: 24,
                  child: const ExploreMapWidget(),
                ),
                const ExploreSearchBarWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExploreMapWidget extends HookConsumerWidget {
  const ExploreMapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMapController(
      userTrackingOption: const UserTrackingOption(),
    );

    useMapIsReady(
      controller: controller,
      mapIsReady: () async {
        await controller.setZoom(zoomLevel: 15);
      },
    );

    useMapListener(
      controller: controller,
      onSingleTap: (p) async {
        await controller.addMarker(p);
      },
    );

    return PContainer(
      child: OSMFlutter(
        osmOption: const OSMOption(),
        controller: controller,
      ),
    );
  }
}
