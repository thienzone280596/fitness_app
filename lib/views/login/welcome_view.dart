import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/views/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: media.width * 0.1,
              ),
              Image.asset(
                "assets/images/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Welcome, Stefani",
                style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "You are all set now, let’s reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
              const Spacer(),
              RoundButton(
                  title: "Go To Home",
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTabView()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
