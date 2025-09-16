
import 'package:fitness/features/home/widgets/icon_info_widget.dart';
import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FitnessResourceWidget extends StatelessWidget {
  const FitnessResourceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Palette.grey.withValues(alpha: 0.2),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/jpgs/gym.jpg",
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Stretching and Recovering Sessions",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  height: 1,
                ),
              ),
              Text(
                "Mal Sakurajima Sensel",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  IconInfo(icon: "assets/svgs/Star.svg", info: "4.1", iconColor: Palette.orange,),
                  SizedBox(width: 10),
                  IconInfo(icon: "assets/svgs/Show.svg", info: "121k", iconColor: Palette.blue,),
                  SizedBox(width: 10),
                  IconInfo(icon: "assets/svgs/Heart.svg", info: "251k", iconColor: Palette.grey,),
                ],
              )
            ],
          ),),
          SizedBox(width: 10),
          SvgPicture.asset(
            "assets/svgs/arrow_right.svg",
            height: 25,
            colorFilter: ColorFilter.mode(Palette.grey, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}