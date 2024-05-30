import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/setting_row.dart';
import 'package:fitness_app/common_widget/title_subtitle_cell.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewwState();
}

class _ProfileViewwState extends State<ProfileView> {
  bool positive = false;
  List accountArr = [
    {
      "image": "assets/images/p_personal.png",
      "name": "Personal Data",
      "tag": "1"
    },
    {"image": "assets/images/p_achi.png", "name": "Achievement", "tag": "2"},
    {
      "image": "assets/images/p_activity.png",
      "name": "Activity History",
      "tag": "3"
    },
    {
      "image": "assets/images/p_workout.png",
      "name": "Workout Progress",
      "tag": "4"
    }
  ];

  List otherArr = [
    {"image": "assets/images/p_contact.png", "name": "Contact Us", "tag": "5"},
    {
      "image": "assets/images/p_privacy.png",
      "name": "Privacy Policy",
      "tag": "6"
    },
    {"image": "assets/images/p_setting.png", "name": "Setting", "tag": "7"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColor.white,
        appBar: AppBar(
          backgroundColor: TColor.white,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/images/nav_back.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            "Profile",
            style: TextStyle(
                color: TColor.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: TColor.lightGray,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assets/images/nav_more.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/u2.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Stefani Wong",
                              style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Lose a Fat Program",
                              style: TextStyle(
                                color: TColor.gray,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 80,
                        child: RoundButton(
                            title: 'Edit',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            type: RoundButtonType.bgGradient,
                            onpressed: () {}),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: TitleSubtitleCell(
                              title: "180cm", subtitle: "Height")),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: TitleSubtitleCell(
                              title: "65kg", subtitle: "Weight")),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child:
                              TitleSubtitleCell(title: "22yo", subtitle: "Age"))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: TColor.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: accountArr.length,
                          itemBuilder: (context, index) {
                            var iObj = accountArr[index] as Map? ?? {};
                            return SettingRow(
                              icon: iObj["image"].toString(),
                              title: iObj["name"].toString(),
                              onPressed: () {},
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: TColor.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notification",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/p_noti.png",
                                  height: 15, width: 15, fit: BoxFit.contain),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  "Pop-up Notification",
                                  style: TextStyle(
                                    color: TColor.blackColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              CustomAnimatedToggleSwitch<bool>(
                                current: positive,
                                values: const [false, true],
                                spacing: 0.0,
                                indicatorSize: const Size.square(30),
                                animationDuration:
                                    const Duration(milliseconds: 200),
                                animationCurve: Curves.linear,
                                onChanged: (b) => setState(() => positive = b),
                                iconBuilder: (context, local, global) {
                                  return const SizedBox();
                                },
                                cursors: const ToggleCursors(
                                    defaultCursor: SystemMouseCursors.click),
                                onTap: (_) =>
                                    setState(() => positive = !positive),
                                iconsTappable: false,
                                wrapperBuilder: (context, global, child) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                          left: 10.0,
                                          right: 10.0,
                                          height: 30.0,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: TColor.secondaryColor2,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50.0)),
                                            ),
                                          )),
                                      child,
                                    ],
                                  );
                                },
                                foregroundIndicatorBuilder: (context, global) {
                                  return SizedBox.fromSize(
                                    size: const Size(40, 25.0),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: TColor.white,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black38,
                                              spreadRadius: 0.05,
                                              blurRadius: 1.1,
                                              offset: Offset(0.0, 0.8))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: TColor.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Other",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: otherArr.length,
                          itemBuilder: (context, index) {
                            var iObj = otherArr[index] as Map? ?? {};
                            return SettingRow(
                              icon: iObj["image"].toString(),
                              title: iObj["name"].toString(),
                              onPressed: () {},
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
