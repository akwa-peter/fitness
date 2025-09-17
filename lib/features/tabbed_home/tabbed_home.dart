import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:fitness/features/home/providers/metrics_provider/metrics_provider.dart';
import 'package:fitness/features/tabbed_home/providers/tab_index_tracker.dart';
import 'package:fitness/features/tabbed_home/tab_index_view.dart';
import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabbedHome extends ConsumerStatefulWidget {
  const TabbedHome({super.key});

  @override
  ConsumerState<TabbedHome> createState() => _TabbedHomeState();
}

class _TabbedHomeState extends ConsumerState<TabbedHome> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(getMetricsProvider.notifier).getMetrics();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var indexTracker = ref.watch(tabIndexTrackerProvider);

    return Scaffold(
      body: GetIndexView(
        index: indexTracker,
      ),
      bottomNavigationBar: CurvedNavigationBar (
        backgroundColor: Palette.transparent,
        items: [
          CurvedNavigationBarItem(
            child: SvgPicture.asset("assets/svgs/Home.svg"),
            // label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset("assets/svgs/Gymnastics.svg"),
            // label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.add),
            // label: 'Add',
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset("assets/svgs/Fastfood.svg"),
            // label: 'Feed',
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset("assets/svgs/Profile.svg"),
            // label: 'Personal',
          ),
        ],
        onTap: (index) {
          ref.read(tabIndexTrackerProvider.notifier).setIndex(value: index);
        },
      ),
    );
  }
}
