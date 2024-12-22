import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class RankingsPage extends ConsumerWidget {
  const RankingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.refresh(rankingsNotifierProvider.future),
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('City Rankings'),
          ),
        ),
        body: const Column(
          children: [
            Expanded(child: RankingsList()),
          ],
        ),
      ),
    );
  }
}
