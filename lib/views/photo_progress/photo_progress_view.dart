import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/views/photo_progress/comparation_view.dart';
import 'package:fitness_app/views/photo_progress/result_view.dart';
import 'package:flutter/material.dart';

class PhotoProgressView extends StatefulWidget {
  const PhotoProgressView({super.key});

  @override
  State<PhotoProgressView> createState() => _PhotoProgressViewState();
}

class _PhotoProgressViewState extends State<PhotoProgressView> {
  List photoArr = [
    {
      "time": "2 June",
      "photo": [
        "assets/images/pp_1.png",
        "assets/images/pp_2.png",
        "assets/images/pp_3.png",
        "assets/images/pp_4.png",
      ]
    },
    {
      "time": "5 May",
      "photo": [
        "assets/images/pp_5.png",
        "assets/images/pp_6.png",
        "assets/images/pp_7.png",
        "assets/images/pp_8.png",
      ]
    }
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
          "Progress Photo",
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
            children: [
              Container(
                  width: double.maxFinite,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color(0xffFFE5E5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/date_photo.png",
                        height: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Reminder!",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Next Photos Fall On July 08",
                            style: TextStyle(
                              color: TColor.blackColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        TColor.primaryColor2.withOpacity(0.4),
                        TColor.primaryColor1.withOpacity(0.4)
                      ]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Track Your Progress Each \nMonth With',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: TColor.blackColor,
                                    fontSize: 12),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Photo',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: TColor.primaryColor1,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 110,
                              height: 35,
                              child: RoundButton(
                                  title: "Learn More",
                                  fontSize: 12,
                                  onpressed: () {}),
                            )
                          ]),
                      Image.asset(
                        "assets/images/progress_banner.png",
                        width: media.width * 0.35,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: 57,
                  decoration: BoxDecoration(
                      color: TColor.primaryColor1.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Compare my Photo',
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
                                            const ComparisonView()));
                              }),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gallery",
                      style: TextStyle(
                          color: TColor.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "viewmore",
                        style: TextStyle(color: TColor.gray, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: photoArr.length,
                  itemBuilder: ((context, index) {
                    var pObj = photoArr[index] as Map? ?? {};
                    var imaArr = pObj["photo"] as List? ?? [];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pObj["time"].toString(),
                            style: TextStyle(color: TColor.gray, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: imaArr.length,
                            itemBuilder: ((context, indexRow) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: 100,
                                decoration: BoxDecoration(
                                  color: TColor.lightGray,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    imaArr[indexRow] as String? ?? "",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
