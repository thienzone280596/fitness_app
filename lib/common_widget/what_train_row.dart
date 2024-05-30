import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class WhatTrainRow extends StatelessWidget {
  final Map wObj;
  const WhatTrainRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          TColor.primaryColor2.withOpacity(0.3),
          TColor.primaryColor1.withOpacity(0.3)
        ]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wObj["title"].toString(),
                      style: TextStyle(
                          color: TColor.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${wObj["exercises"].toString()} | ${wObj["time"].toString()}",
                      style: TextStyle(color: TColor.gray, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: RoundButton(
                        type: RoundButtonType.textGradient,
                        title: "View more",
                        fontWeight: FontWeight.w400,
                        elevation: 0.1,
                        fontSize: 10,
                        onpressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.54),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      wObj["image"].toString(),
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
