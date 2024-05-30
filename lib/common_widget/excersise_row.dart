import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';

class ExcersiseRow extends StatelessWidget {
  final VoidCallback onPressed;
  final Map eObj;
  const ExcersiseRow({super.key, required this.eObj, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              eObj["image"].toString(),
              width: 60,
              height: 60,
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
                eObj["title"].toString(),
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${eObj["value"]}",
                style: TextStyle(color: TColor.gray, fontSize: 10),
              ),
            ]),
          ),
          IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                "assets/images/next_icon.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
