import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/on_boarding_page.dart';
import 'package:fitness_app/views/login/signup_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();
  int selectPage = 0;
  List pageArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/images/on_1.png"
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image": "assets/images/on_2.png"
    },
    {
      "title": "Eat Well",
      "subtitle":
          "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "image": "assets/images/on_3.png"
    },
    {
      "title": "Improve Sleep  Quality",
      "subtitle":
          "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      "image": "assets/images/on_4.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      selectPage = pageController.page?.round() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return OnboardingPageView(
                pObj: pObj,
              );
            },
            controller: pageController,
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  color: TColor.primaryColor1,
                  value: (selectPage + 1) / 4,
                  strokeWidth: 2,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: TColor.primaryColor1,
                    borderRadius: BorderRadius.circular(35)),
                child: IconButton(
                  icon: Icon(
                    Icons.navigate_next,
                    color: TColor.white,
                  ),
                  onPressed: () {
                    if (selectPage < 3) {
                      // Open welcome
                      selectPage = selectPage + 1;
                      pageController.animateToPage(selectPage,
                          duration: const Duration(microseconds: 600),
                          curve: Curves.bounceInOut);

                      setState(() {});
                    } else {
                      //todo open login screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpView()));
                    }
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
