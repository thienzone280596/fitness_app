import 'package:fitness_app/common/color_extention.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class NutritionRow extends StatelessWidget {
  final Map nObj;
  const NutritionRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var val = double.tryParse(nObj["value"].toString()) ?? 1;
    var maxVal = double.tryParse(nObj["max_value"].toString()) ?? 1;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(
                  nObj["title"].toString(),
                  style: TextStyle(color: TColor.blackColor, fontSize: 12),
                ),
                const SizedBox(
                  width: 4,
                ),
                Image.asset(
                  nObj["image"],
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Text(
                  "${nObj["value"].toString()} ${nObj["unit_name"].toString()}",
                  style: TextStyle(color: TColor.gray, fontSize: 11),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              SimpleAnimationProgressBar(
                height: 10,
                width: media.width - 30,
                backgroundColor: Colors.grey.shade100,
                foregrondColor: Colors.purple,
                ratio: val / maxVal,
                direction: Axis.horizontal,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 3),
                borderRadius: BorderRadius.circular(7.5),
                gradientColor: LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
