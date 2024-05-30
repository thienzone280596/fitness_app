import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/views/onboarding/on_boarding_view.dart';

import 'package:flutter/material.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        height: media.height,
        decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text('Fitness',
                    style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w700)),
                Text('Everybody Can Train',
                    style: TextStyle(
                        color: TColor.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                const Spacer(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: RoundButton(
                      title: 'Get Started',
                      type: isChangeColor
                          ? RoundButtonType.textGradient
                          : RoundButtonType.bgGradient,
                      onpressed: () {
                        if (isChangeColor) {
                          //todo next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnboardingView()),
                          );
                        } else {
                          setState(() {
                            isChangeColor = true;
                          });
                        }
                      },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
