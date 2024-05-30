import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/food_step_detail.dart';
import 'package:fitness_app/common_widget/ingredients_cell.dart';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class FoodInfoDetailsView extends StatefulWidget {
  final Map mObj;
  final Map dObj;
  const FoodInfoDetailsView(
      {super.key, required this.dObj, required this.mObj});

  @override
  State<FoodInfoDetailsView> createState() => _FoodInfoDetailsViewState();
}

class _FoodInfoDetailsViewState extends State<FoodInfoDetailsView> {
  List nutritionArr = [
    {"image": "assets/images/burn.png", "title": "180kCal"},
    {"image": "assets/images/eggs.png", "title": "30g fats"},
    {"image": "assets/images/protein.png", "title": "20g proteins"},
    {"image": "assets/images/carbo.png", "title": "50g carbo"},
  ];

  List ingredientsArr = [
    {
      "image": "assets/images/flour.png",
      "title": "Wheat Flour",
      "value": "100grm"
    },
    {"image": "assets/images/sugar.png", "title": "Sugar", "value": "3 tbsp"},
    {
      "image": "assets/images/baking_soda.png",
      "title": "Baking Soda",
      "value": "2tsp"
    },
    {"image": "assets/images/eggs.png", "title": "Eggs", "value": "2 items"},
  ];

  List stepArr = [
    {"no": "1", "detail": "Prepare all of the ingredients that needed"},
    {"no": "2", "detail": "Mix flour, sugar, salt, and baking powder"},
    {
      "no": "3",
      "detail":
          "In a seperate place, mix the eggs and liquid milk until blended"
    },
    {
      "no": "4",
      "detail":
          "Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth"
    },
    {"no": "5", "detail": "Prepare all of the ingredients that needed"},
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
                flexibleSpace: ClipRect(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Transform.scale(
                        scale: 1.25,
                        child: Container(
                          width: media.width * 0.55,
                          height: media.width * 0.55,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius:
                                BorderRadius.circular(media.width * 0.275),
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 1.25,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            widget.dObj["b_image"].toString(),
                            width: media.width * 0.50,
                            height: media.width * 0.50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
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
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: TColor.gray.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.dObj["name"].toString(),
                                      style: TextStyle(
                                          color: TColor.blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "by James Ruth",
                                      style: TextStyle(
                                          color: TColor.gray, fontSize: 12),
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
                                  fit: BoxFit.contain,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Nutrition",
                            style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: nutritionArr.length,
                              itemBuilder: (context, index) {
                                var nObj = nutritionArr[index] as Map? ?? {};
                                return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            TColor.primaryColor2
                                                .withOpacity(0.4),
                                            TColor.primaryColor1
                                                .withOpacity(0.4)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          nObj["image"].toString(),
                                          width: 15,
                                          height: 15,
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            nObj["title"].toString(),
                                            style: TextStyle(
                                                color: TColor.blackColor,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Descriptions",
                            style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ReadMoreText(
                            'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being',
                            trimLines: 4,
                            colorClickableText: Colors.blueAccent,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' Read More ...',
                            trimExpandedText: ' Read Less',
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                            ),
                            moreStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.blueAccent),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ingredients That You\nWill Need",
                                style: TextStyle(
                                    color: TColor.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "${stepArr.length} Items",
                                  style: TextStyle(
                                      color: TColor.gray, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            height: (media.width * 0.25) + 40,
                            child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: ingredientsArr.length,
                                itemBuilder: (context, index) {
                                  var nObj =
                                      ingredientsArr[index] as Map? ?? {};
                                  return IngredientsCell(nObj: nObj);
                                })),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Step by Step",
                                style: TextStyle(
                                    color: TColor.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "${stepArr.length} Steps",
                                  style: TextStyle(
                                      color: TColor.gray, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: stepArr.length,
                          itemBuilder: (context, index) {
                            var sObj = stepArr[index] as Map? ?? {};
                            var isLast = sObj == stepArr.last;
                            return FoodStepDetail(sObj: sObj, isLast: isLast);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
