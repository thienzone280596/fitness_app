import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/add_alarm_next_row.dart';

import 'package:fitness_app/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class AddAlarmView extends StatefulWidget {
  const AddAlarmView({super.key});

  @override
  State<AddAlarmView> createState() => _AddAlarmViewState();
}

class _AddAlarmViewState extends State<AddAlarmView> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.white,
          centerTitle: true,
          elevation: 0,
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
            "Add Alarm",
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
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
        backgroundColor: TColor.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              AddAlarmNextRow(
                  icon: "assets/images/bed_stroke.png",
                  title: "Bedtime",
                  time: "09:00 PM",
                  color: TColor.lightGray.withOpacity(0.7),
                  onPressed: () {}),
              const SizedBox(
                height: 15,
              ),
              AddAlarmNextRow(
                  icon: "assets/images/time_circle.png",
                  title: "Hours of sleep",
                  time: "8hours 30minutes",
                  color: TColor.lightGray.withOpacity(0.7),
                  onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              AddAlarmNextRow(
                  icon: "assets/images/repeat.png",
                  title: "Repeat",
                  time: "Mon to Fri",
                  color: TColor.lightGray.withOpacity(0.7),
                  onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/vibrate.png",
                        width: 18,
                        height: 18,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Vibrate When Alarm Sound",
                        style: TextStyle(color: TColor.gray, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Transform.scale(
                        scale: 0.7,
                        child: CustomAnimatedToggleSwitch<bool>(
                          current: positive,
                          values: const [false, true],
                          spacing: 0.0,
                          indicatorSize: const Size.square(30),
                          animationDuration: const Duration(milliseconds: 200),
                          animationCurve: Curves.linear,
                          onChanged: (b) => setState(() => positive = b),
                          iconBuilder: (context, local, global) {
                            return const SizedBox();
                          },
                          cursors: const ToggleCursors(
                              defaultCursor: SystemMouseCursors.click),
                          onTap: (_) => setState(() => positive = !positive),
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
                                        borderRadius: const BorderRadius.all(
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
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              RoundButton(title: "Add", onpressed: () {}),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )));
  }
}
