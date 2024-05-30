import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/excersise_row.dart';
import 'package:flutter/material.dart';

class ExcersiseSetSection extends StatelessWidget {
  final Map sObj;
  final Function(Map obj) onPressed;
  const ExcersiseSetSection(
      {super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var exercisesArr = sObj["set"] as List? ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          sObj["name"].toString(),
          style: TextStyle(
              color: TColor.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: exercisesArr.length,
            itemBuilder: (context, index) {
              var eObj = exercisesArr[index] as Map? ?? {};
              return ExcersiseRow(
                eObj: eObj,
                onPressed: () {
                  onPressed(eObj);
                },
              );
            }),
      ],
    );
  }
}
