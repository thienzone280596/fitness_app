import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitness_app/common/color_extention.dart';

import 'package:fitness_app/common_widget/meal_food_schedule_row.dart';
import 'package:fitness_app/common_widget/nutrition_row.dart';
import 'package:flutter/material.dart';

class MealScheduleView extends StatefulWidget {
  const MealScheduleView({super.key});

  @override
  State<MealScheduleView> createState() => _MealScheduleViewState();
}

class _MealScheduleViewState extends State<MealScheduleView> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  Random random = Random();
  late DateTime _selectedDateAppBBar;
  List breakfastArr = [
    {
      "name": "Honey Pancake",
      "time": "07:00am",
      "image": "assets/images/honey_pancake.png"
    },
    {"name": "Coffee", "time": "07:30am", "image": "assets/images/coffee.png"},
  ];

  List lunchArr = [
    {
      "name": "Chicken Steak",
      "time": "01:00pm",
      "image": "assets/images/chicken_steak.png"
    },
    {"name": "Milk", "time": "01:20pm", "image": "assets/images/milk.png"},
  ];
  List snacksArr = [
    {"name": "Orange", "time": "04:30pm", "image": "assets/images/orange.png"},
    {
      "name": "Apple Pie",
      "time": "04:40pm",
      "image": "assets/images/apple_pie.png"
    },
  ];
  List dinnerArr = [
    {"name": "Salad", "time": "07:10pm", "image": "assets/images/salad.png"},
    {
      "name": "Oatmeal",
      "time": "08:10pm",
      "image": "assets/images/oatmeal.png"
    },
  ];

  List nutritionArr = [
    {
      "title": "Calories",
      "image": "assets/images/burn.png",
      "unit_name": "kCal",
      "value": "350",
      "max_value": "500",
    },
    {
      "title": "Proteins",
      "image": "assets/images/protein.png",
      "unit_name": "g",
      "value": "300",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": "assets/images/eggs.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
    {
      "title": "Carbo",
      "image": "assets/images/carbo.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
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
          "Meal Schedule",
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

              onDateSelected: (date) {
                _selectedDateAppBBar = date;
              },
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
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Breakfast",
                              style: TextStyle(
                                  color: TColor.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "${breakfastArr.length} meals | 230 calories",
                                style:
                                    TextStyle(color: TColor.gray, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: breakfastArr.length,
                        itemBuilder: (context, index) {
                          var mObj = breakfastArr[index] as Map? ?? {};
                          return MealFoodSchedleRow(
                            mObj: mObj,
                            index: index,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lunch",
                              style: TextStyle(
                                  color: TColor.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "${lunchArr.length} meals | 500 calories",
                                style:
                                    TextStyle(color: TColor.gray, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lunchArr.length,
                        itemBuilder: (context, index) {
                          var mObj = lunchArr[index] as Map? ?? {};
                          return MealFoodSchedleRow(
                            mObj: mObj,
                            index: index,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Snacks",
                              style: TextStyle(
                                  color: TColor.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "${lunchArr.length} meals | 140 calories",
                                style:
                                    TextStyle(color: TColor.gray, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snacksArr.length,
                        itemBuilder: (context, index) {
                          var mObj = snacksArr[index] as Map? ?? {};
                          return MealFoodSchedleRow(
                            mObj: mObj,
                            index: index,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dinner",
                              style: TextStyle(
                                  color: TColor.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "${lunchArr.length} meals | 120 calories",
                                style:
                                    TextStyle(color: TColor.gray, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: dinnerArr.length,
                        itemBuilder: (context, index) {
                          var mObj = dinnerArr[index] as Map? ?? {};
                          return MealFoodSchedleRow(
                            mObj: mObj,
                            index: index,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today Meal Nutritions",
                              style: TextStyle(
                                  color: TColor.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: nutritionArr.length,
                        itemBuilder: (context, index) {
                          var nObj = nutritionArr[index] as Map? ?? {};
                          return NutritionRow(
                            nObj: nObj,
                          );
                        },
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
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
