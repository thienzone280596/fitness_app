import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/excersise_set_section.dart';
import 'package:fitness_app/common_widget/icon_title_next_row.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/views/workout_tracker/excersise_step_detail.dart';
import 'package:fitness_app/views/workout_tracker/workout_schedule_view.dart';
import 'package:flutter/material.dart';

class WorkoutDetailiew extends StatefulWidget {
  final Map dObj;
  const WorkoutDetailiew({super.key, required this.dObj});

  @override
  State<WorkoutDetailiew> createState() => _WorkoutDetailiewState();
}

class _WorkoutDetailiewState extends State<WorkoutDetailiew> {
  List latestArr = [
    {
      "image": "assets/images/workout1.png",
      "title": "Fullbody Workout",
      "time": "Today, 03:00pm"
    },
    {
      "image": "assets/images/workout2.png",
      "title": "Upperbody Workout",
      "time": "June 05, 02:00pm"
    },
  ];

  List youArr = [
    {"image": "assets/images/barbel.png", "title": "Barbell"},
    {"image": "assets/images/skipping_rope.png", "title": "Skipping Rope"},
    {"image": "assets/images/bottle.png", "title": "Bottle 1 Liters"},
  ];

  List exercisesArr = [
    {
      "name": "Set 1",
      "set": [
        {
          "image": "assets/images/warm_up.png",
          "title": "Warm Up",
          "value": "05:00"
        },
        {
          "image": "assets/images/jumping.png",
          "title": "Jumping Jack",
          "value": "12x"
        },
        {
          "image": "assets/images/skipping.png",
          "title": "Skipping",
          "value": "15x"
        },
        {
          "image": "assets/images/squarts.png",
          "title": "Squats",
          "value": "20x"
        },
        {
          "image": "assets/images/arm_raises.png",
          "title": "Arm Raises",
          "value": "00:53"
        },
        {
          "image": "assets/images/rest_and_drink.png",
          "title": "Rest and Drink",
          "value": "02:00"
        },
      ],
    },
    {
      "name": "Set 2",
      "set": [
        {
          "image": "assets/images/warm_up.png",
          "title": "Warm Up",
          "value": "05:00"
        },
        {
          "image": "assets/images/jumping.png",
          "title": "Jumping Jack",
          "value": "12x"
        },
        {
          "image": "assets/images/squarts.png",
          "title": "Skipping",
          "value": "15x"
        },
        {
          "image": "assets/images/squarts.png",
          "title": "Squats",
          "value": "20x"
        },
        {
          "image": "assets/images/arm_raises.png",
          "title": "Arm Raises",
          "value": "00:53"
        },
        {
          "image": "assets/images/rest_and_drink.png",
          "title": "Rest and Drink",
          "value": "02:00"
        },
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                pinned: true,
                elevation: 0,
                // pinned: true,
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
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                leadingWidth: 0,
                leading: Container(),
                expandedHeight: media.width * 0.5,
                flexibleSpace: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/detail_top.png",
                    width: media.width * 0.75,
                    height: media.width * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ];
          },
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: TColor.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Scaffold(
              backgroundColor: TColor.white,
              body: Stack(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                            color: TColor.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.dObj["title"].toString(),
                                  style: TextStyle(
                                      color: TColor.blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${widget.dObj["exercises"].toString()} | ${widget.dObj["time"].toString()} | | 320 Calories Burn",
                                  style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/fav.png",
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      IconTitleNextRow(
                          icon: "assets/images/date.png",
                          title: "Schedule Workout",
                          time: "5/27, 09:00 AM",
                          color: TColor.primaryColor1.withOpacity(0.3),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WorkoutScheduleView()));
                          }),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      IconTitleNextRow(
                          icon: "assets/images/difficulity.png",
                          title: "Difficulity",
                          time: "Beginner",
                          color: TColor.secondaryColor1.withOpacity(0.3),
                          onPressed: () {}),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'You’ll Need',
                            style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("${youArr.length} items",
                                style: TextStyle(
                                    color: TColor.gray, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: youArr.length,
                            itemBuilder: (context, index) {
                              var yObj = youArr[index] as Map? ?? {};
                              return Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: media.width * 0.35,
                                      width: media.width * 0.35,
                                      decoration: BoxDecoration(
                                          color: TColor.lightGray,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        yObj["image"].toString(),
                                        width: media.width * 0.2,
                                        height: media.width * 0.2,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        yObj["title"].toString(),
                                        style: TextStyle(
                                            color: TColor.blackColor,
                                            fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Exercises',
                            style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("${exercisesArr.length} Sets",
                                style: TextStyle(
                                    color: TColor.gray, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: exercisesArr.length,
                        itemBuilder: (context, index) {
                          var sObj = exercisesArr[index] as Map? ?? {};
                          return ExcersiseSetSection(
                              sObj: sObj,
                              onPressed: (obj) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ExcersiseStepDetail(eObj: obj)));
                              });
                        },
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RoundButton(title: "Start Workout", onpressed: () {})
                    ],
                  ),
                )
              ]),
            ),
          )),
    );
  }
}
