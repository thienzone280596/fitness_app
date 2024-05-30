import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/notification_row.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArr = [
    {
      "image": "assets/images/workout1.png",
      "title": "Hey, it’s time for lunch",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/images/workout2.png",
      "title": "Don’t miss your lowerbody workout",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/images/workout3.png",
      "title": "Hey, let’s add some meals for your b",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/images/workout1.png",
      "title": "Congratulations, You have finished A..",
      "time": "29 May"
    },
    {
      "image": "assets/images/workout2.png",
      "title": "Hey, it’s time for lunch",
      "time": "8 April"
    },
    {
      "image": "assets/images/workout3.png",
      "title": "Ups, You have missed your Lowerbo...",
      "time": "8 April"
    },
  ];
  @override
  Widget build(BuildContext context) {
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
            "Notification",
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
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            itemBuilder: (context, index) {
              var wObj = notificationArr[index] as Map? ?? {};
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: NotifiCationRow(
                    wObj: wObj,
                  ));
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: TColor.gray.withOpacity(0.5),
                height: 1,
              );
            },
            itemCount: notificationArr.length));
  }
}
