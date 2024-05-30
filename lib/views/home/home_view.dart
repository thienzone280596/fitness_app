import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/workout_row.dart';
import 'package:fitness_app/views/home/activity_tracker_view.dart';
import 'package:fitness_app/views/home/finished_workout_view.dart';
import 'package:fitness_app/views/home/notification_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List lastWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/images/workout1.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/images/workout2.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Ab Workout",
      "image": "assets/images/workout3.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
  ];

  List<int> showingTooltipOnSpots = [21];

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

  List waterArr = [
    {"title": "6am - 8am", "subtitle": "600ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "4pm - now", "subtitle": "900ml"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            TColor.primaryColor2.withOpacity(0.4),
            TColor.primaryColor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: const FlDotData(show: true),
        gradient: LinearGradient(
          colors: TColor.primaryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back,',
                          style:
                              TextStyle(color: TColor.blackColor, fontSize: 12),
                        ),
                        Text(
                          'Stefani Wong',
                          style: TextStyle(
                              color: TColor.blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                      ],
                    ),
                    //todo icon bell
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationView()));
                        },
                        icon: Image.asset(
                          "assets/images/notification_active.png",
                          width: 25,
                          height: 25,
                          fit: BoxFit.fitHeight,
                        ))
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                //todo banner
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(media.width * 0.075)),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/bg_dots.png",
                        height: media.width * 0.4,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BMI (Body Max Index)',
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'You have a normal weight',
                                  style: TextStyle(
                                    color: TColor.white.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: media.width * 0.02,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 120,
                                  child: RoundButton(
                                      title: 'view more',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      type: RoundButtonType.bgSGradient,
                                      onpressed: () {}),
                                )
                              ],
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback: (FlTouchEvent event,
                                        pieTouchResponse) {},
                                  ),
                                  startDegreeOffset: 250,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //todo below banner
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
                          'Today Taget',
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
                                            const ActivityTrackerView()));
                              }),
                        )
                      ]),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  'Activity Status',
                  style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    height: media.width * 0.4,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: TColor.primaryColor1.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25)),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Heart Rate',
                                style: TextStyle(
                                    color: TColor.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                          colors: TColor.primaryG,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  '78 BPM',
                                  style: TextStyle(
                                      color: TColor.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Todo Chart
                        LineChart(
                          LineChartData(
                            showingTooltipIndicators:
                                showingTooltipOnSpots.map((index) {
                              return ShowingTooltipIndicators([
                                LineBarSpot(
                                  tooltipsOnBar,
                                  lineBarsData.indexOf(tooltipsOnBar),
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
                            lineBarsData: lineBarsData,
                            minY: 0,
                            maxY: 130,
                            titlesData: const FlTitlesData(
                              show: false,
                            ),
                            gridData: const FlGridData(show: false),
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
                //todo
                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        height: media.width * 0.95,
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, color: Colors.black12)
                            ]),
                        child: Row(
                          children: [
                            SimpleAnimationProgressBar(
                              height: media.width * 0.85,
                              width: media.width * 0.07,
                              backgroundColor: Colors.grey.shade100,
                              foregrondColor: Colors.purple,
                              ratio: 0.5,
                              direction: Axis.vertical,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 3),
                              borderRadius: BorderRadius.circular(15),
                              gradientColor: LinearGradient(
                                  colors: TColor.primaryG,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Water Intake',
                                  style: TextStyle(
                                      color: TColor.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                            colors: TColor.primaryG,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)
                                        .createShader(Rect.fromLTRB(
                                            0, 0, bounds.width, bounds.height));
                                  },
                                  child: Text(
                                    '4 Liters',
                                    style: TextStyle(
                                        color: TColor.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Real time update',
                                  style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: waterArr.map((wObj) {
                                      var isLast = wObj == waterArr.last;
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4),
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color:
                                                        TColor.secondaryColor2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              ),
                                              if (!isLast)
                                                DottedDashedLine(
                                                  height: media.width * 0.08,
                                                  width: 0,
                                                  axis: Axis.vertical,
                                                  dashColor: TColor
                                                      .secondaryColor1
                                                      .withOpacity(0.3),
                                                )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                wObj["title"].toString(),
                                                style: TextStyle(
                                                    color: TColor.gray,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              ShaderMask(
                                                blendMode: BlendMode.srcIn,
                                                shaderCallback: (bounds) {
                                                  return LinearGradient(
                                                          colors:
                                                              TColor.secondaryG,
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight)
                                                      .createShader(
                                                          Rect.fromLTRB(
                                                              0,
                                                              0,
                                                              bounds.width,
                                                              bounds.height));
                                                },
                                                child: Text(
                                                  wObj["subtitle"].toString(),
                                                  style: TextStyle(
                                                      color: TColor.white
                                                          .withOpacity(0.7),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    }).toList())
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.05,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            width: double.infinity,
                            height: media.width * 0.45,
                            decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2, color: Colors.black12)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sleep',
                                  style: TextStyle(
                                      color: TColor.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                            colors: TColor.primaryG,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)
                                        .createShader(Rect.fromLTRB(
                                            0, 0, bounds.width, bounds.height));
                                  },
                                  child: Text(
                                    '8h 20min',
                                    style: TextStyle(
                                        color: TColor.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/sleep_graph.png",
                                  width: double.maxFinite,
                                  fit: BoxFit.fitWidth,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            width: double.infinity,
                            height: media.width * 0.45,
                            decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2, color: Colors.black12)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'calories',
                                  style: TextStyle(
                                      color: TColor.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                            colors: TColor.primaryG,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)
                                        .createShader(Rect.fromLTRB(
                                            0, 0, bounds.width, bounds.height));
                                  },
                                  child: Text(
                                    '760 kCal',
                                    style: TextStyle(
                                        color: TColor.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: media.width * 0.2,
                                    height: media.width * 0.2,
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: media.width * 0.15,
                                            height: media.width * 0.15,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: TColor.primaryColor1
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        media.width * 0.075)),
                                            child: FittedBox(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                '230 Cal \nleft',
                                                style: TextStyle(
                                                    color: TColor.white,
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                          SimpleCircularProgressBar(
                                            startAngle: -180,
                                            progressStrokeWidth: 10,
                                            backStrokeWidth: 10,
                                            valueNotifier: ValueNotifier(50),
                                            backColor: Colors.grey.shade100,
                                            progressColors: TColor.primaryG,
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workout Progress',
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
                                  lineBarsData.indexOf(tooltipsOnBar),
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
                            minY: -0.5,
                            maxY: 110,
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
                              verticalInterval: 25,
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
                    SizedBox(
                      height: 25,
                      width: 80,
                      child: RoundButton(
                          title: 'Check',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          type: RoundButtonType.bgGradient,
                          onpressed: () {}),
                    )
                  ],
                ),
                InkWell(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lastWorkoutArr.length,
                    itemBuilder: (context, index) {
                      var wObj = lastWorkoutArr[index] as Map? ?? {};

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FinishWorkoutView()));
                        },
                        child: WorkoutRow(wObj: wObj),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        var color0 = TColor.secondaryColor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0,
                value: 25,
                title: '',
                radius: 50,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: const Text(
                  '20,1',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );
          default:
            throw Error();
        }
      },
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.primaryColor2.withOpacity(0.5),
          TColor.primaryColor1.withOpacity(0.5),
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.secondaryColor2.withOpacity(0.5),
          TColor.secondaryColor1.withOpacity(0.5),
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
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
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
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
