import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class MealReacommendCell extends StatelessWidget {
  final Map fObj;
  final int index;
  const MealReacommendCell(
      {super.key, required this.fObj, required this.index});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isEvent = index % 2 == 0;

    return Container(
      margin: const EdgeInsets.all(8),
      width: media.width * 0.5,
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
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                fObj["image"].toString(),
                width: media.width * 0.3,
                height: media.width * 0.25,
                fit: BoxFit.contain,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              fObj["name"],
              style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "${fObj["size"]} | ${fObj["ttime"]} | ${fObj["kcal"]}",
              style: TextStyle(color: TColor.gray, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 90,
              height: 25,
              child: RoundButton(
                  fontSize: 12,
                  type: isEvent
                      ? RoundButtonType.bgGradient
                      : RoundButtonType.bgSGradient,
                  title: "View",
                  onpressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
