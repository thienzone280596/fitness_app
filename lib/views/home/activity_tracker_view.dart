import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/latest_activity_row.dart';
import 'package:fitness_app/common_widget/today_target_cell.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class ActivityTrackerView extends StatefulWidget {
  const ActivityTrackerView({super.key});

  @override
  State<ActivityTrackerView> createState() => _ActtivityTrackerViewState();
}

class _ActtivityTrackerViewState extends State<ActivityTrackerView> {
  int touchedIndex = -1;

  List latestArr = [
    {
      "image": "assets/images/pic4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/images/pic5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
            "ActivityTracker",
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
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      color: TColor.primaryColor1.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(colors: [
                        TColor.primaryColor2.withOpacity(0.3),
                        TColor.primaryColor1.withOpacity(0.3)
                      ])),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Today Taget',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: TColor.primaryG,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MaterialButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    textColor: TColor.primaryColor1,
                                    color: Colors.transparent,
                                    elevation: 0,
                                    minWidth: double.maxFinite,
                                    height: 30,
                                    child: Icon(
                                      Icons.add,
                                      color: TColor.white,
                                      size: 12,
                                    )),
                              ),
                            )
                          ]),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: TodayTargetCell(
                            icon: "assets/images/water.png",
                            title: "8L",
                            value: "Water Intake",
                          )),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: TodayTargetCell(
                            icon: "assets/images/foot.png",
                            title: "2400",
                            value: "Foot Steps",
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Activity Progress',
                      style: TextStyle(
                          color: TColor.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: TColor.primaryG),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: ["Weekly", "Monthly"]
                                .map((name) => DropdownMenuItem(
                                      value: name,
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                            color: TColor.gray, fontSize: 14),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {},
                            icon: Icon(Icons.expand_more, color: TColor.white),
                            hint: Text(
                              "Weekly",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  height: media.width * 0.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ],
                  ),
                  child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (_) => Colors.grey,
                          tooltipHorizontalAlignment:
                              FLHorizontalAlignment.right,
                          tooltipMargin: 10,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            String weekDay;
                            switch (group.x) {
                              case 0:
                                weekDay = 'Monday';
                                break;
                              case 1:
                                weekDay = 'Tuesday';
                                break;
                              case 2:
                                weekDay = 'Wednesday';
                                break;
                              case 3:
                                weekDay = 'Thursday';
                                break;
                              case 4:
                                weekDay = 'Friday';
                                break;
                              case 5:
                                weekDay = 'Saturday';
                                break;
                              case 6:
                                weekDay = 'Sunday';
                                break;
                              default:
                                throw Error();
                            }
                            return BarTooltipItem(
                              '$weekDay\n',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (rod.toY - 1).toString(),
                                  style: const TextStyle(
                                    color:
                                        Colors.white, //widget.touchedBarColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: getTitles,
                            reservedSize: 38,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingGroups(),
                      gridData: const FlGridData(show: false),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Workout',
                      style: TextStyle(
                          color: TColor.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'view more',
                          style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ))
                  ],
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: latestArr.length,
                  itemBuilder: (context, index) {
                    var wObj = latestArr[index] as Map? ?? {};
                    return LatestActivityRow(wObj: wObj);
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.gray,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 1:
        text = Text('Mon', style: style);
        break;
      case 2:
        text = Text('Tue', style: style);
        break;
      case 3:
        text = Text('Wed', style: style);
        break;
      case 4:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, TColor.primaryG,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 15, TColor.secondaryG,
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 8, TColor.primaryG,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 17, TColor.secondaryG,
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 7.5, TColor.primaryG,
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 9, TColor.secondaryG,
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, TColor.primaryG,
                isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(
    int x,
    double y,
    List<Color> barColor, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(
              colors: barColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: TColor.lightGray,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
