import 'package:fitness/features/home/home.dart';
import 'package:fitness/utilities/color_pallet.dart';
import 'package:fitness/utilities/strings.dart';
import 'package:flutter/material.dart';

class Fitness extends StatelessWidget {
  const Fitness({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        iconTheme: IconThemeData(
          color: Palette.grey,
        ),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: "Roboto",
          // bodyColor: Colors.black,
          // displayColor: Colors.black,
        ).merge(
          const TextTheme(
            headlineLarge: TextStyle(fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(fontWeight: FontWeight.bold),
            displayLarge: TextStyle(fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontWeight: FontWeight.bold),
            displaySmall: TextStyle(fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Palette.black,
          ),
          unselectedLabelColor: Palette.grey,
          unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w700,
            // color: Palette.grey,
          ),
          labelColor: Palette.white,
          labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            // color: Palette.white,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
        ),
      ),
      home: Home(),
    );
  }
}
