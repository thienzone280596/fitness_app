import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common/common.dart';
import 'package:fitness_app/common_widget/icon_title_next_row.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScheduleView extends StatefulWidget {
  final DateTime date;
  const AddScheduleView({super.key, required this.date});

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
          "Workout Schedule",
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/date.png",
                  width: 20,
                  height: 20,
                  color: TColor.gray,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Time",
              style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: media.width * 0.35,
              child: CupertinoDatePicker(
                onDateTimeChanged: (newDate) {},
                initialDateTime: DateTime.now(),
                use24hFormat: false,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.time,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Detail Workout",
              style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            IconTitleNextRow(
                icon: "assets/images/choose_workout.png",
                title: "Choose Workout",
                time: "Upperbody Workout",
                color: TColor.lightGray.withOpacity(0.7),
                onPressed: () {}),
            const SizedBox(
              height: 15,
            ),
            IconTitleNextRow(
                icon: "assets/images/difficulity.png",
                title: "Difficulity",
                time: "Beginner",
                color: TColor.lightGray.withOpacity(0.7),
                onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            IconTitleNextRow(
                icon: "assets/images/repetitions.png",
                title: "Custom Repetitions",
                time: "",
                color: TColor.lightGray.withOpacity(0.7),
                onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            IconTitleNextRow(
                icon: "assets/images/repetitions.png",
                title: "Custom Weights",
                time: "",
                color: TColor.lightGray.withOpacity(0.7),
                onPressed: () {}),
            const Spacer(),
            RoundButton(title: "Save", onpressed: () {}),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
