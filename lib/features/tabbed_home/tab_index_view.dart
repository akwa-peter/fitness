import 'package:fitness/features/food/food.dart';
import 'package:fitness/features/gym/gym.dart';
import 'package:fitness/features/home/home.dart';
import 'package:fitness/features/profile/profile.dart';
import 'package:flutter/material.dart';

class GetIndexView extends StatelessWidget {
  final int? index;

  const GetIndexView({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return Gym();
      case 2:
        return Container();
      case 3:
        return const Food();
      case 4:
        return const Profile();
      default:
        return const Home();
    }
  }
}