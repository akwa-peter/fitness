
import 'package:fitness/features/home/widgets/icon_info_widget.dart';
import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DietsNutritionWidget extends StatelessWidget {
  const DietsNutritionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage("assets/jpgs/salad_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClassOfFoodWidget(
                  quantity: "25g",
                  nutrient: "Protein",
                ),
                SizedBox(height: 5),
                ClassOfFoodWidget(
                  quantity: "17g",
                  nutrient: "Fat",
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salad & Egg",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall,
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          IconInfo(
                            icon: "assets/svgs/Voice.svg",
                            info: "548kcal",
                            iconSize: 20,
                            iconColor: Palette.grey,
                          ),
                          SizedBox(width: 16),
                          IconInfo(
                            icon: "assets/svgs/TimeSquare.svg",
                            info: "20min",
                            iconSize: 20,
                            iconColor: Palette.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  "assets/svgs/ArrowRightSquare.svg",
                  height: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClassOfFoodWidget extends StatelessWidget {
  final String quantity;
  final String nutrient;

  const ClassOfFoodWidget({
    super.key,
    required this.quantity,
    required this.nutrient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(child: Text(quantity, style: Theme.of(context).textTheme.titleMedium)),
          Text(
            nutrient,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}