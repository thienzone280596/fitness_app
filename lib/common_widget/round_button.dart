import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

enum RoundButtonType { bgGradient, bgSGradient, textGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final RoundButtonType type;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;
  const RoundButton(
      {super.key,
      required this.title,
      this.type = RoundButtonType.bgGradient,
      this.fontSize = 15,
      this.fontWeight = FontWeight.w700,
      this.elevation = 1,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: type == RoundButtonType.bgSGradient
                ? TColor.secondaryG
                : TColor.primaryG,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(25),
        boxShadow: type == RoundButtonType.bgSGradient ||
                type == RoundButtonType.bgGradient
            ? const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 2, offset: Offset(0, 2))
              ]
            : null,
      ),
      child: MaterialButton(
        onPressed: onpressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textColor: TColor.primaryColor1,
        color: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Colors.transparent
            : TColor.white,
        elevation: type == RoundButtonType.bgSGradient ||
                type == RoundButtonType.bgGradient
            ? 0
            : elevation,
        minWidth: double.maxFinite,
        height: 50,
        child: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Text(title,
                style: TextStyle(
                    color: TColor.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight))
            : ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: TColor.primaryG,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(title,
                    style: TextStyle(
                        color: TColor.primaryColor1,
                        fontSize: fontSize,
                        fontWeight: fontWeight)),
              ),
      ),
    );
  }
}
