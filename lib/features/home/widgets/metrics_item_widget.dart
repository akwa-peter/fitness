
import 'package:fitness/network/models/metrics/metrics.dart';
import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MetricsItemWidget extends StatelessWidget {
  final Metrics metrics;
  const MetricsItemWidget({
    super.key,
    required this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color(int.parse(metrics.color!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  metrics.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(color: Palette.white),
                ),
              ),
              SvgPicture.asset(
                metrics.icon ?? "assets/svgs/Star.svg",
                height: 18,
                colorFilter: ColorFilter.mode(
                  Palette.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          Expanded(
            child: SvgPicture.asset(
              metrics.chart ?? "assets/svgs/BarArea.svg",
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
                text: metrics.percentage ?? "88",
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(color: Palette.white),
                children: [
                  TextSpan(
                      text: metrics.unit ?? "%",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Palette.white
                      )
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}