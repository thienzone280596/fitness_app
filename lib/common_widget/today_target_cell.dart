import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class TodayTargetCell extends StatelessWidget {
  final String icon;
  final String value;
  final String title;
  const TodayTargetCell(
      {super.key,
      required this.icon,
      required this.value,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: TColor.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: TColor.primaryG,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(
                  value,
                  style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
