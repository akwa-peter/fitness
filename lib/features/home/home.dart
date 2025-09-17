import 'package:fitness/features/home/providers/metrics_provider/metrics_provider.dart';
import 'package:fitness/features/home/widgets/diets_nutrients_widget.dart';
import 'package:fitness/features/home/widgets/metrics_item_widget.dart';
import 'package:fitness/features/home/widgets/shaded_text.dart';
import 'package:fitness/network/models/metrics/metrics.dart';
import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'widgets/fitness_resource_widget.dart';
import 'widgets/icon_info_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  TabController? _activitiesTabController;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _activitiesTabController = TabController(length: 5, vsync: this);
    _activitiesTabController?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var metricsState = ref.watch(getMetricsProvider);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              image: DecorationImage(
                image: AssetImage("assets/jpgs/app_bar_bg_image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month, size: 18),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          DateFormat(
                            "MMM dd, yyyy",
                          ).format(DateTime.now()).toUpperCase(),
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Palette.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Palette.white.withValues(alpha: 0.3),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: SvgPicture.asset(
                                "assets/svgs/Notification.svg",
                                height: 25,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Palette.orange,
                                child: Text(
                                  "5",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall?.copyWith(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                    color: Palette.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/jpgs/profile_image.jpg",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, Makise!",
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(color: Palette.white),
                            ),
                            SizedBox(height: 3),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconInfo(
                                  icon: "assets/svgs/Star.svg",
                                  info: "88% Healthy",
                                ),
                                SizedBox(width: 10),
                                IconInfo(
                                  icon: "assets/svgs/Star.svg",
                                  info: "Pro",
                                  iconColor: Palette.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        "assets/svgs/arrow_right.svg",
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(getMetricsProvider.notifier).getMetrics();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    metricsState.when(
                      data: (data) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Fitness Metrics",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                Text(
                                  "See All",
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(color: Palette.orange),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              height: 230,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Metrics metrics = data[index];
                                  return MetricsItemWidget(metrics: metrics);
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(width: 16),
                                itemCount: data.length,
                              ),
                            ),
                          ],
                        );
                      },
                      error: (error, stackTrace) {
                        return Center(child: Text(error.toString()));
                      },
                      loading: () {
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "Workouts",
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                                TextSpan(
                                  text: "(25)",
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(color: Palette.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Icon(Icons.menu),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/jpgs/gym.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconInfo(
                                  icon: "assets/svgs/TimeSquare.svg",
                                  info: "25min",
                                  iconSize: 24,
                                  iconColor: Palette.grey,
                                ),
                                SizedBox(width: 16),
                                IconInfo(
                                  icon: "assets/svgs/Voice.svg",
                                  info: "412kcal",
                                  iconSize: 24,
                                  iconColor: Palette.grey,
                                ),
                              ],
                            ),
                            SizedBox(height: 100),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Upper Strength 2",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(color: Palette.white),
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        children: [
                                          Text(
                                            "8 Series workout",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall?.copyWith(
                                              color: Palette.white,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Palette.grey.withValues(
                                                alpha: 0.4,
                                              ),
                                            ),
                                            child: Text(
                                              "Intense",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall?.copyWith(
                                                color: Palette.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/svgs/Play.svg",
                                  height: 60,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Diets & Nutrition",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          "See All",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Palette.orange),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 260,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return DietsNutritionWidget();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 16);
                        },
                        itemCount: 3,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Activities",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          "See All",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Palette.orange),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/jpgs/BarLineChart.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Palette.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TabBar(
                                controller: _activitiesTabController,
                                tabAlignment: TabAlignment.fill,
                                // indicator: tabDecoration(allTransactionTabs ? 2 : 1,
                                //     (_tabController?.index ?? 0)),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Palette.white),
                                tabs: [
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        "1d",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleSmall,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        "1w",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleSmall,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        "1m",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleSmall,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        "1y",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleSmall,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        "All",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 130),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1,548 kcal",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineSmall?.copyWith(
                                          color: Palette.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        children: [
                                          IconInfo(
                                            icon: "assets/svgs/TimeSquare.svg",
                                            info: "+ 285",
                                            iconSize: 24,
                                            iconColor: Palette.grey,
                                          ),
                                          SizedBox(width: 16),
                                          IconInfo(
                                            icon: "assets/svgs/Voice.svg",
                                            info: "412kcal",
                                            iconSize: 24,
                                            iconColor: Palette.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/svgs/Activity.svg",
                                  height: 60,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Virtual AI Coach",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Icon(Icons.menu),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/jpgs/gym.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ShadedTextBg(text: "GPT-5",),
                                SizedBox(width: 16),
                                ShadedTextBg(text: "2M LLMS",),
                              ],
                            ),
                            SizedBox(height: 100),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1,879+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(color: Palette.white),
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        children: [
                                          Text(
                                            "AI Conversations",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall?.copyWith(
                                              color: Palette.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/svgs/Chat.svg",
                                  height: 60,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Fitness Resources",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          "See All",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Palette.orange),
                        ),
                      ],
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index){
                      return FitnessResourceWidget();
                    }, separatorBuilder: (context, index){
                      return SizedBox(height: 16);
                    }, itemCount: 3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
