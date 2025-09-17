import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedTabIcon extends StatelessWidget {
  final String icon;

  const SelectedTabIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Palette.grey.withValues(alpha: 0.2),
      ),
      child: Stack(
        children: [
          Center(child: SvgPicture.asset(icon, height: 18)),
          Positioned(
            bottom: 2,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: 5,
              height: 4,
              decoration: BoxDecoration(
                color: Palette.orange,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}