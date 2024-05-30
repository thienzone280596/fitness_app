import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/round_textfield.dart';
import 'package:fitness_app/views/login/what_your_goat_view.dart';

import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController textDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/compleate_profile.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Text(
                  'Let’s complete your profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'It will help us to know more about you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: TColor.lightGray,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Image.asset(
                            "assets/images/gender.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: TColor.gray,
                          )),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: ["Male", "Female"]
                                .map((name) => DropdownMenuItem(
                                    value: name,
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                          color: TColor.blackColor,
                                          fontSize: 12),
                                    )))
                                .toList(),
                            onChanged: (value) {},
                            hint: Text(
                              'Choose Gender',
                              style: TextStyle(
                                  color: TColor.blackColor, fontSize: 12),
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hintText: 'Date of Birth',
                  icon: 'assets/images/calender.png',
                  controller: textDate,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(children: [
                  const Expanded(
                    child: RoundTextField(
                        hintText: 'Your weight',
                        icon: 'assets/images/weight.png'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.secondaryG),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'KG',
                      style: TextStyle(color: TColor.white, fontSize: 12),
                    ),
                  )
                ]),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(children: [
                  const Expanded(
                    child: RoundTextField(
                        hintText: 'Your weight',
                        icon: 'assets/images/height.png'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.secondaryG),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'CM',
                      style: TextStyle(color: TColor.white, fontSize: 12),
                    ),
                  )
                ]),
                SizedBox(
                  height: media.width * 0.1,
                ),
                RoundButton(
                    title: 'Next >',
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WhatYourGoatView()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
