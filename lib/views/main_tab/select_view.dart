import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/views/meal_planner/meal_planner_view.dart';
import 'package:fitness_app/views/sleep_tracker/sleep_tracker_view.dart';
import 'package:fitness_app/views/workout_tracker/workout_tracker_view.dart';
import 'package:flutter/material.dart';

class SelectView extends StatelessWidget {
  const SelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
                title: "Workout Tracker",
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WorkoutTrackerView()));
                }),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
                title: "Meal Planner",
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MealPlannerView()));
                }),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
                title: "Sleep Tracker",
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SleepTrackerView()));
                })
          ],
        ),
      ),
    );
  }
}
