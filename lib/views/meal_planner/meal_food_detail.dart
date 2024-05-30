import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/meal_category_cell.dart';
import 'package:fitness_app/common_widget/meal_recommend_cell.dart';
import 'package:fitness_app/common_widget/popular_meal_row.dart';
import 'package:fitness_app/views/meal_planner/food_info_details_view.dart';

import 'package:flutter/material.dart';

class MealFoodDetailsView extends StatefulWidget {
  final Map eObj;
  const MealFoodDetailsView({super.key, required this.eObj});

  @override
  State<MealFoodDetailsView> createState() => _MealFoodDetailsViewState();
}

class _MealFoodDetailsViewState extends State<MealFoodDetailsView> {
  List categoryArr = [
    {
      "name": "Salad",
      "image": "assets/images/category1.png",
    },
    {
      "name": "Cake",
      "image": "assets/images/category2.png",
    },
    {
      "name": "Pie",
      "image": "assets/images/category3.png",
    },
    {
      "name": "Smoothies",
      "image": "assets/images/cattegory4.png",
    },
  ];

  List popularArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/f_1.png",
      "b_image": "assets/images/pancake_1.png",
      "size": "Medium",
      "time": "30mins",
      "kcal": "230kCal"
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/f_2.png",
      "b_image": "assets/images/nigiri.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "120kCal"
    },
  ];

  List recommendArr = [
    {
      "name": "Honey Pancake",
      "image": "assets/images/rd_1.png",
      "size": "Easy",
      "time": "30mins",
      "kcal": "180kCal"
    },
    {
      "name": "Canai Bread",
      "image": "assets/images/rd_2.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "230kCal"
    },
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController txtSearch = TextEditingController();
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
            "${widget.eObj["name"]}",
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
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: txtSearch,
                          decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                "assets/images/search.png",
                                width: 25,
                                height: 25,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Search Pancake",
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: TColor.gray.withOpacity(0.7))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 1,
                        height: 25,
                        color: TColor.gray.withOpacity(0.3),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/filter.png",
                          width: 25,
                          height: 25,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Category",
                    style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryArr.length,
                      itemBuilder: (context, index) {
                        var cObj = categoryArr[index] as Map? ?? {};
                        return MealCategoryCell(cObj: cObj, index: index);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Recommendation for Diet",
                    style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: media.width * 0.6,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendArr.length,
                      itemBuilder: (context, index) {
                        var cObj = recommendArr[index] as Map? ?? {};
                        return MealReacommendCell(fObj: cObj, index: index);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: popularArr.length,
                    itemBuilder: (context, index) {
                      var fObj = popularArr[index] as Map? ?? {};
                      return InkWell(
                        child: PopularMealRow(mObj: fObj),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodInfoDetailsView(
                                dObj: fObj,
                                mObj: widget.eObj,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
