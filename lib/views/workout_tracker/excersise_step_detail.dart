import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/step_detail_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExcersiseStepDetail extends StatefulWidget {
  final Map eObj;
  const ExcersiseStepDetail({super.key, required this.eObj});

  @override
  State<ExcersiseStepDetail> createState() => _ExcersiseStepDetailState();
}

class _ExcersiseStepDetailState extends State<ExcersiseStepDetail> {
  List stepArr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "detail":
          "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "detail":
          "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"
    },
    {
      "no": "03",
      "title": "Adjust Foot Movement",
      "detail":
          "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "detail":
          "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: TColor.white),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
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
                    "assets/images/btn_close.png",
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
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryG),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/images/video_temp.png",
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: TColor.blackColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/play.png",
                        width: 28,
                        height: 28,
                      ))
                ]),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.eObj["title"].toString(),
                  style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Easy | 390 Calories Burn",
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 12,
                      decoration: TextDecoration.none),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Descriptions",
                  style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                ReadMoreText(
                  'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide',
                  trimLines: 4,
                  colorClickableText: TColor.blackColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Read More ...',
                  trimExpandedText: ' Read Less',
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none),
                  moreStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How To Do It',
                      style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("${stepArr.length} items",
                          style: TextStyle(
                            color: TColor.gray,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          )),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: stepArr.length,
                  itemBuilder: (context, index) {
                    var sObj = stepArr[index] as Map? ?? {};
                    var isLast = sObj == stepArr.last;
                    return StepDetailRow(sObj: sObj, isLast: isLast);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Custom Repetitions',
                      style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: CupertinoPicker.builder(
                      itemExtent: 40,
                      selectionOverlay: Container(
                        width: double.maxFinite,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: TColor.gray.withOpacity(0.2), width: 1),
                            bottom: BorderSide(
                                color: TColor.gray.withOpacity(0.2), width: 1),
                          ),
                        ),
                      ),
                      onSelectedItemChanged: (index) {},
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/burn.png",
                              width: 15,
                              height: 15,
                            ),
                            Text(
                              " ${(index + 1) * 15} Calories Burn",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 10),
                            ),
                            Text(
                              " ${index + 1} ",
                              style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              " times",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 16),
                            )
                          ],
                        );
                      }),
                ),
                RoundButton(title: "Save", elevation: 0, onpressed: () {}),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
