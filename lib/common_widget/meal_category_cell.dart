import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class MealCategoryCell extends StatelessWidget {
  final Map cObj;
  final int index;
  const MealCategoryCell({super.key, required this.cObj, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isEvent = index % 2 == 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isEvent
                ? [
                    TColor.primaryColor2.withOpacity(0.5),
                    TColor.primaryColor1.withOpacity(0.5)
                  ]
                : [
                    TColor.secondaryColor2.withOpacity(0.5),
                    TColor.secondaryColor1.withOpacity(0.5)
                  ],
          ),
          borderRadius: BorderRadius.circular(20)),
      height: 120,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17.5),
            child: Container(
              decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(17.5)),
              child: Image.asset(
                "${cObj["image"]}",
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              "${cObj["name"]}",
              maxLines: 1,
              style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
