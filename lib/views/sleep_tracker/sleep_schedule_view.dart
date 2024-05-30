import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/meal_food_schedule_row.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/today_sleep_schedule_row.dart';
import 'package:fitness_app/views/sleep_tracker/add_alarm_view.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class SleepScheduleView extends StatefulWidget {
  const SleepScheduleView({super.key});

  @override
  State<SleepScheduleView> createState() => _SleepScheduleViewState();
}

class _SleepScheduleViewState extends State<SleepScheduleView> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  Random random = Random();

  List scheduleSleepArr = [
    {
      "name": "Bedtime",
      "image": "assets/images/bed.png",
      "time": "01/06/2024 09:00 PM",
      "duration": "in 6hours 22minutes"
    },
    {
      "name": "Alarm",
      "image": "assets/images/alarm_clock.png",
      "time": "02/06/2024 05:10 AM",
      "duration": "in 14hours 30minutes"
    },
  ];

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
          "Sleep Schedule",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                height: media.width * 0.35,
                decoration: BoxDecoration(
                    color: TColor.primaryColor1.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ideal Hours for Sleep',
                            style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'You have a normal weight',
                            style: TextStyle(
                              color: TColor.primaryColor1,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: media.width * 0.05),
                          SizedBox(
                            height: 35,
                            width: 120,
                            child: RoundButton(
                                title: 'view more',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                type: RoundButtonType.bgGradient,
                                onpressed: () {}),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/sleep_banner.png",
                        width: media.width * 0.35,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Your Schedule",
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            CalendarAgenda(
              controller: _calendarAgendaControllerAppBar,
              appbar: false,
              selectedDayPosition: SelectedDayPosition.center,
              leading: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/arrowLeft.png",
                    width: 15,
                    height: 15,
                  )),
              training: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/arrowRight.png",
                    width: 15,
                    height: 15,
                  )),
              weekDay: WeekDay.short,
              dayNameFontSize: 12,
              dayNumberFontSize: 16,
              dayBGColor: Colors.grey.withOpacity(0.15),
              titleSpaceBetween: 15,
              backgroundColor: Colors.transparent,
              // fullCalendar: false,
              fullCalendarScroll: FullCalendarScroll.horizontal,
              fullCalendarDay: WeekDay.short,
              selectedDateColor: Colors.white,
              dateColor: Colors.black,
              locale: 'en',

              initialDate: DateTime.now(),
              calendarEventColor: TColor.primaryColor2,
              firstDate: DateTime.now().subtract(const Duration(days: 140)),
              lastDate: DateTime.now().add(const Duration(days: 60)),

              onDateSelected: (date) {},
              selectedDayLogo: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: TColor.primaryG,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: media.width * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: scheduleSleepArr.length,
                itemBuilder: (context, index) {
                  var wObj = scheduleSleepArr[index] as Map? ?? {};
                  return InkWell(
                    child: TodaySleepScheduleRow(wObj: wObj),
                    onTap: () {},
                  );
                },
              ),
            ),
            Container(
                width: double.maxFinite,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      TColor.secondaryColor2.withOpacity(0.4),
                      TColor.secondaryColor1.withOpacity(0.4)
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You will get 8hours 10minutes\nfor tonight",
                      style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SimpleAnimationProgressBar(
                          height: 15,
                          width: media.width - 80,
                          backgroundColor: Colors.grey.shade100,
                          foregrondColor: Colors.purple,
                          ratio: 0.96,
                          direction: Axis.horizontal,
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(seconds: 3),
                          borderRadius: BorderRadius.circular(7.5),
                          gradientColor: LinearGradient(
                              colors: TColor.secondaryG,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        Text(
                          "96%",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddAlarmView()));
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.secondaryG),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          child: Icon(
            Icons.add,
            size: 20,
            color: TColor.white,
          ),
        ),
      ),
    );
  }
}
