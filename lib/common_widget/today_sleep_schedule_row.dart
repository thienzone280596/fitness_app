import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common/common.dart';

import 'package:flutter/material.dart';

class TodaySleepScheduleRow extends StatefulWidget {
  final Map wObj;
  const TodaySleepScheduleRow({super.key, required this.wObj});

  @override
  State<TodaySleepScheduleRow> createState() => _TodaySleepScheduleRowState();
}

class _TodaySleepScheduleRowState extends State<TodaySleepScheduleRow> {
  @override
  Widget build(BuildContext context) {
    bool positive = false;
    // var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              widget.wObj["image"].toString(),
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
              Row(
                children: [
                  Text(
                    widget.wObj["name"].toString(),
                    style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    getStringDateToOtherFormat(widget.wObj["time"]),
                    style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                "${widget.wObj["duration"]}",
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
          Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(
              "assets/images/icon_more.png",
              width: 14,
              height: 14,
              fit: BoxFit.cover,
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
          ]),
        ],
      ),
    );
  }
}
