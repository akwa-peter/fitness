
import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconInfo extends StatelessWidget {
  final String icon;
  final String info;
  final Color? iconColor;
  final double? iconSize;
  const IconInfo({
    super.key,
    required this.icon,
    required this.info,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: iconSize ?? 12,
          colorFilter: ColorFilter.mode(iconColor ?? Palette.grey, BlendMode.srcIn),
        ),
        SizedBox(width: 5),
        Text(
          info,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(
            color: Palette.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}