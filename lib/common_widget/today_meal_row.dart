import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common/common.dart';
import 'package:flutter/material.dart';

class TodayMealRow extends StatelessWidget {
  final Map mObj;
  const TodayMealRow({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              mObj["image"].toString(),
              width: 50,
              height: 50,
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
                mObj["name"].toString(),
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${getDayTitle(mObj["time"].toString())} | ${getStringDateToOtherFormat(mObj["time"].toString(), outFormatStr: "h:mm aa")}",
                style: TextStyle(color: TColor.gray, fontSize: 10),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
          Image.asset(
            "assets/images/bell.png",
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
