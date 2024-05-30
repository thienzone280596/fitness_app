import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/views/login/welcome_view.dart';
import 'package:flutter/material.dart';

class WhatYourGoatView extends StatefulWidget {
  const WhatYourGoatView({super.key});

  @override
  State<WhatYourGoatView> createState() => _WhatYourGoatViewState();
}

class _WhatYourGoatViewState extends State<WhatYourGoatView> {
  CarouselController buttonCarouselController = CarouselController();
  List goalArr = [
    {
      "image": "assets/images/goat_1.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat \nand need / want to build more \nmuscle"
    },
    {
      "image": "assets/images/goat_2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have \nno shape. I want to add learn \nmuscle in the right way"
    },
    {
      "image": "assets/images/goat_3.png",
      "title": "Lose a Fat",
      "subtitle":
          "I have over 20 lbs to lose. I want to \ndrop all this fat and gain muscle \nmass"
    }
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items: goalArr
                    .map((gObj) => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: media.width * 0.07, horizontal: 25),
                          child: FittedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  gObj["image"].toString(),
                                  width: media.width * 0.5,
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  height: media.width * 0.1,
                                ),
                                Text(
                                  gObj["title"].toString(),
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width: media.width * 0.1,
                                  height: 1,
                                  color: TColor.white,
                                ),
                                SizedBox(
                                  height: media.width * 0.02,
                                ),
                                Text(
                                  gObj["subtitle"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TColor.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 0.74,
                  initialPage: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    'What is your goal ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'It will help us to choose a best \nprogram for you',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundButton(
                      title: 'Confirm',
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeView()));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
