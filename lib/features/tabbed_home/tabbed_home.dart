import 'package:fitness/features/home/providers/metrics_provider/metrics_provider.dart';
import 'package:fitness/features/tabbed_home/providers/tab_index_tracker.dart';
import 'package:fitness/features/tabbed_home/tab_index_view.dart';
import 'package:fitness/features/tabbed_home/widgets/selected_tab_widget.dart';
import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'buttom_nav_painter.dart';

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
      extendBody: true,
      body: GetIndexView(index: indexTracker),
      bottomNavigationBar: CustomPaint(
        painter: BottomNavPainter(),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon:
                indexTracker == 0
                    ? SelectedTabIcon(icon: "assets/svgs/Home.svg")
                    : SvgPicture.asset("assets/svgs/Home.svg", colorFilter: ColorFilter.mode(Palette.grey, BlendMode.srcIn),),
                onPressed: () {
                  ref
                      .read(tabIndexTrackerProvider.notifier)
                      .setIndex(value: 0);
                },
              ),
              IconButton(
                icon:
                indexTracker == 1
                    ? SelectedTabIcon(icon: "assets/svgs/Gymnastics.svg")
                    : SvgPicture.asset("assets/svgs/Gymnastics.svg", colorFilter: ColorFilter.mode(Palette.grey, BlendMode.srcIn),),
                onPressed: () {
                  ref
                      .read(tabIndexTrackerProvider.notifier)
                      .setIndex(value: 1);
                },
              ),
              SizedBox(width: 60), // space for FAB
              IconButton(
                icon:
                indexTracker == 2
                    ? SelectedTabIcon(icon: "assets/svgs/Fastfood.svg")
                    : SvgPicture.asset("assets/svgs/Fastfood.svg", colorFilter: ColorFilter.mode(Palette.grey, BlendMode.srcIn),),
                onPressed: () {
                  ref
                      .read(tabIndexTrackerProvider.notifier)
                      .setIndex(value: 2);
                },
              ),
              IconButton(
                icon:
                indexTracker == 3
                    ? SelectedTabIcon(icon: "assets/svgs/Profile.svg")
                    : SvgPicture.asset("assets/svgs/Profile.svg", colorFilter: ColorFilter.mode(Palette.grey, BlendMode.srcIn),),
                onPressed: () {
                  ref
                      .read(tabIndexTrackerProvider.notifier)
                      .setIndex(value: 3);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: Icon(Icons.add, size: 30, color: Palette.white),
      ),
    );
  }
}
