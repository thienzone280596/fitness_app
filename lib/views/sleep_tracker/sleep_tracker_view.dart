import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/today_sleep_schedule_row.dart';
import 'package:fitness_app/common_widget/upcoming_workout_row.dart';
import 'package:fitness_app/views/sleep_tracker/sleep_schedule_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SleepTrackerView extends StatefulWidget {
  const SleepTrackerView({super.key});

  @override
  State<SleepTrackerView> createState() => _SleepTrackerViewState();
}

class _SleepTrackerViewState extends State<SleepTrackerView> {
  List<int> showingTooltipOnSpots = [4];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40)
      ];

  List todaySleepArr = [
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

    final tooltipsOnBar = lineBarsData1[0];
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
            "Sleep Tracker",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    height: media.width * 0.5,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        //Todo char 2
                        LineChart(
                          LineChartData(
                            showingTooltipIndicators:
                                showingTooltipOnSpots.map((index) {
                              return ShowingTooltipIndicators([
                                LineBarSpot(
                                  tooltipsOnBar,
                                  lineBarsData1.indexOf(tooltipsOnBar),
                                  tooltipsOnBar.spots[index],
                                ),
                              ]);
                            }).toList(),
                            lineTouchData: LineTouchData(
                              enabled: true,
                              handleBuiltInTouches: false,
                              touchCallback: (FlTouchEvent event,
                                  LineTouchResponse? response) {
                                if (response == null ||
                                    response.lineBarSpots == null) {
                                  return;
                                }
                                if (event is FlTapUpEvent) {
                                  final spotIndex =
                                      response.lineBarSpots!.first.spotIndex;
                                  showingTooltipOnSpots.clear;
                                  setState(() {
                                    showingTooltipOnSpots.add(spotIndex);
                                  });
                                }
                              },
                              mouseCursorResolver: (FlTouchEvent event,
                                  LineTouchResponse? response) {
                                if (response == null ||
                                    response.lineBarSpots == null) {
                                  return SystemMouseCursors.basic;
                                }
                                return SystemMouseCursors.click;
                              },
                              getTouchedSpotIndicator:
                                  (LineChartBarData barData,
                                      List<int> spotIndexes) {
                                return spotIndexes.map((index) {
                                  return TouchedSpotIndicatorData(
                                    const FlLine(
                                      color: Colors.transparent,
                                    ),
                                    FlDotData(
                                      show: true,
                                      getDotPainter:
                                          (spot, percent, barData, index) =>
                                              FlDotCirclePainter(
                                        radius: 3,
                                        color: Colors.white,
                                        strokeWidth: 3,
                                        strokeColor: TColor.secondaryColor1,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },
                              touchTooltipData: LineTouchTooltipData(
                                getTooltipColor: (touchedSpot) =>
                                    TColor.secondaryColor1,
                                tooltipRoundedRadius: 20,
                                getTooltipItems:
                                    (List<LineBarSpot> lineBarsSpot) {
                                  return lineBarsSpot.map((lineBarSpot) {
                                    return LineTooltipItem(
                                      "${lineBarSpot.x.toInt()} mins ago",
                                      const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                            lineBarsData: lineBarsData1,
                            minY: -0.01,
                            maxY: 10.01,
                            titlesData: FlTitlesData(
                                show: true,
                                leftTitles: const AxisTitles(),
                                topTitles: const AxisTitles(),
                                rightTitles:
                                    AxisTitles(sideTitles: rightTitles),
                                bottomTitles: AxisTitles(
                                  sideTitles: bottomTitles(),
                                )),
                            gridData: FlGridData(
                              show: true,
                              horizontalInterval: 2,
                              drawHorizontalLine: true,
                              drawVerticalLine: false,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                    color: TColor.gray.withOpacity(0.4),
                                    strokeWidth: 1);
                              },
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Last Night Sleep',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '8h 20m',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/images/sleep_graph.png",
                        color: Colors.white,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  height: 57,
                  decoration: BoxDecoration(
                      color: TColor.primaryColor1.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Daily Sleep Schedule',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(
                          height: 25,
                          width: 80,
                          child: RoundButton(
                              title: 'Check',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              type: RoundButtonType.bgGradient,
                              onpressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SleepScheduleView()));
                              }),
                        )
                      ]),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today Schedule',
                      style: TextStyle(
                          color: TColor.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
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
                  itemCount: todaySleepArr.length,
                  itemBuilder: (context, index) {
                    var wObj = todaySleepArr[index] as Map? ?? {};
                    return InkWell(
                      child: TodaySleepScheduleRow(wObj: wObj),
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.primaryColor2,
          TColor.primaryColor1,
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            TColor.primaryColor2,
            TColor.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        spots: const [
          FlSpot(1, 3),
          FlSpot(2, 5),
          FlSpot(3, 4),
          FlSpot(4, 7),
          FlSpot(5, 4),
          FlSpot(6, 8),
          FlSpot(7, 5),
        ],
      );

  SideTitles bottomTitles() => SideTitles(
        getTitlesWidget: bottomTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Tue', style: style);
        break;
      case 4:
        text = const Text('Wed', style: style);
        break;
      case 5:
        text = const Text('Thu', style: style);
        break;
      case 6:
        text = const Text('Fri', style: style);
        break;
      case 7:
        text = const Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 2,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0h';
        break;
      case 2:
        text = '2h';
        break;
      case 4:
        text = '4h';
        break;
      case 6:
        text = '6h';
        break;
      case 8:
        text = '8h';
        break;
      case 10:
        text = '10h';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: TColor.gray,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }
}
