import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealFoodSchedleRow extends StatelessWidget {
  final Map mObj;
  final int index;
  // ignore: non_constant_identifier_names
  const MealFoodSchedleRow(
      {super.key, required this.mObj, required this.index});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    bool isEvent = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
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
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                mObj["image"].toString(),
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                mObj["name"].toString(),
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${mObj["time"]}",
                style: TextStyle(color: TColor.gray, fontSize: 10),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
          Image.asset(
            "assets/images/next_icon.png",
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
