import 'dart:math';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common/common.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/views/workout_tracker/add_schedule_view.dart';
import 'package:flutter/material.dart';

class WorkoutScheduleView extends StatefulWidget {
  const WorkoutScheduleView({super.key});

  @override
  State<WorkoutScheduleView> createState() => _WorkoutScheduleViewState();
}

class _WorkoutScheduleViewState extends State<WorkoutScheduleView> {
  List eventArr = [
    {
      "name": "Ab Workout",
      "start_time": "20/05/2024 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "20/05/2024 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "20/05/2024 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "21/05/2024 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "21/05/2024 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "21/05/2024 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "27/05/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "27/05/2024 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "27/05/2024 03:00 PM",
    }
  ];

  List selectDayEventArr = [];

  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  Random random = Random();
  late DateTime _selectedDateAppBBar;

  void setDayEventWorkoutList() {
    var date = dateToStartDate(_selectedDateAppBBar);
    selectDayEventArr = eventArr.map((wObj) {
      return {
        "name": wObj["name"],
        "start_time": wObj["start_time"],
        "date": stringToDate(wObj["start_time"].toString(),
            formatStr: "dd/MM/yyyy hh:mm aa")
      };
    }).where((wObj) {
      return dateToStartDate(wObj["date"] as DateTime) == date;
    }).toList();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    setDayEventWorkoutList();
  }

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
      body: Column(
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
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: media.width * 1.5,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var timeLineDataWith = media.width * 1.5 - (80 + 40);
                      var availWidth = (media.width * 1.2) - (80 + 40);
                      var slotArr = selectDayEventArr.where((wObj) {
                        return (wObj["date"] as DateTime).hour == index;
                      }).toList();
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              getTime(index * 60),
                              style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 12,
                              ),
                            ),
                            if (slotArr.isNotEmpty)
                              Expanded(
                                  child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: slotArr.map((sObj) {
                                        var min =
                                            (sObj["date"] as DateTime).minute;

                                        var pos = min / 60 * 2 - 1;
                                        return Align(
                                          alignment: Alignment(pos, 0),
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 15,
                                                                horizontal: 20),
                                                        decoration: BoxDecoration(
                                                            color: TColor.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    margin:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8),
                                                                    height: 40,
                                                                    width: 40,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration: BoxDecoration(
                                                                        color: TColor
                                                                            .lightGray,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/btn_close.png",
                                                                      width: 15,
                                                                      height:
                                                                          15,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Workout Schedule",
                                                                  style: TextStyle(
                                                                      color: TColor
                                                                          .blackColor,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    margin:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8),
                                                                    height: 40,
                                                                    width: 40,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration: BoxDecoration(
                                                                        color: TColor
                                                                            .lightGray,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/nav_more.png",
                                                                      width: 15,
                                                                      height:
                                                                          15,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              "${sObj["name"]}",
                                                              style: TextStyle(
                                                                color: TColor
                                                                    .blackColor,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Image.asset(
                                                                  "assets/images/time.png",
                                                                  width: 20,
                                                                  height: 20,
                                                                ),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Text(
                                                                  "${getDayTitle(sObj["start_time"].toString())}|${getStringDateToOtherFormat(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                                                  style: TextStyle(
                                                                      color: TColor
                                                                          .gray,
                                                                      fontSize:
                                                                          12),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            RoundButton(
                                                                title:
                                                                    "Mark as Done",
                                                                onpressed:
                                                                    () {}),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              width: availWidth * 0.5,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              alignment: Alignment.centerLeft,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors:
                                                          TColor.secondaryG),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          17.5)),
                                              child: Text(
                                                "${sObj["name"].toString()}, ${getStringDateToOtherFormat(sObj["start_time"].toString(), outFormatStr: "hh:mm a")}",
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: TColor.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList()))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey.withOpacity(0.2),
                        height: 1,
                      );
                    },
                    itemCount: 24),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddScheduleView(
                        date: _selectedDateAppBBar,
                      )));
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
