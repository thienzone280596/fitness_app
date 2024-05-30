import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class NotifiCationRow extends StatelessWidget {
  final Map wObj;
  const NotifiCationRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            wObj["image"].toString(),
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              wObj["title"].toString(),
              style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "${wObj["time"]}",
              style: TextStyle(color: TColor.gray, fontSize: 10),
            ),
          ]),
        ),
      ],
    );
  }
}
