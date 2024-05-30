import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String icon;
  final TextInputType? keyboardType;
  final EdgeInsets? margin;
  final bool obscureText;
  final Widget? rightIcon;

  const RoundTextField(
      {super.key,
      required this.hintText,
      this.controller,
      required this.icon,
      this.keyboardType,
      this.margin,
      this.rightIcon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: TColor.lightGray, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            suffixIcon: rightIcon,
            prefixIcon: Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                child: Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                  color: TColor.gray,
                )),
            hintStyle: TextStyle(color: TColor.gray, fontSize: 12)),
      ),
    );
  }
}
