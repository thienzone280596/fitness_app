import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class TitleSubtitleCell extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleSubtitleCell(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Column(
        children: [
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
              title,
              style: TextStyle(
                  color: TColor.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
                color: TColor.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
