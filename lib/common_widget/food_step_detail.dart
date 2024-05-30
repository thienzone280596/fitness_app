import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class FoodStepDetail extends StatelessWidget {
  final Map sObj;
  final bool isLast;
  const FoodStepDetail({super.key, required this.sObj, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 25,
          child: Text(
            sObj["no"].toString(),
            style: TextStyle(
                color: TColor.secondaryColor1,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: TColor.secondaryColor1,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(color: TColor.white, width: 3),
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            if (!isLast)
              DottedDashedLine(
                  height: 80,
                  width: 0,
                  dashColor: TColor.secondaryColor1,
                  axis: Axis.vertical)
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Step ${sObj["no"].toString()}",
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 14,
                    decoration: TextDecoration.none),
              ),
              Text(
                sObj["detail"].toString(),
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        )
      ],
    );
  }
}
