import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class IngredientsCell extends StatelessWidget {
  final Map nObj;
  const IngredientsCell({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: media.width * 0.23,
            height: media.width * 0.23,
            decoration: BoxDecoration(
                color: TColor.gray.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Image.asset(
              "${nObj["image"]}",
              width: 46,
              height: 46,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            nObj["title"].toString(),
            style: TextStyle(color: TColor.blackColor, fontSize: 12),
          ),
          Text(
            nObj["value"].toString(),
            style: TextStyle(color: TColor.gray, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
