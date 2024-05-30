import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class FinishWorkoutView extends StatefulWidget {
  const FinishWorkoutView({super.key});

  @override
  State<FinishWorkoutView> createState() => _FinishWorkoutViewState();
}

class _FinishWorkoutViewState extends State<FinishWorkoutView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/compleate_workout.png",
                height: media.width,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                'Congratulations, You Have Finished Your Workout',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Exercises is king and nutrition is queen. Combine the two and you will have a kingdom',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              Text(
                '-Jack Lalanne',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              RoundButton(
                  title: 'Back to home',
                  onpressed: () {
                    //todo Button register
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
