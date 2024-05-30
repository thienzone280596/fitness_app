import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class AddAlarmNextRow extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  final VoidCallback onPressed;
  final Color color;
  const AddAlarmNextRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.time,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: 57,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: Image.asset(
              icon,
              width: 18,
              height: 18,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 12, color: TColor.gray),
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              time,
              style: TextStyle(fontSize: 12, color: TColor.gray),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
              height: 25,
              width: 25,
              child: Container(
                alignment: Alignment.center,
                width: 25,
                height: 25,
                child: Image.asset(
                  "assets/images/p_next.png",
                  width: 12,
                  height: 12,
                ),
              )),
        ]),
      ),
    );
  }
}
