import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';

class ShadedTextBg extends StatelessWidget {
  final String text;
  const ShadedTextBg({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        text,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(
          color: Palette.white,
        ),
      ),
    );
  }
}