import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/round_textfield.dart';
import 'package:fitness_app/views/login/compleate_profile.dart';
import 'package:fitness_app/views/login/login_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpView> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Hey There',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.blackColor, fontSize: 16),
                ),
                Text(
                  'Create an Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                const RoundTextField(
                    hintText: 'First name',
                    icon: 'assets/images/user_text.png'),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const RoundTextField(
                    hintText: 'Last name', icon: 'assets/images/user_text.png'),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const RoundTextField(
                  hintText: 'Email',
                  icon: 'assets/images/email.png',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hintText: 'Password',
                  icon: 'assets/images/lock.png',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  rightIcon: TextButton(
                    onPressed: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/images/show_Password.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: TColor.gray,
                        )),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: isCheck
                          ? const Icon(Icons.check_box_outlined)
                          : const Icon(Icons.check_box_outline_blank_outlined),
                      color: TColor.gray,
                      iconSize: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Expanded(
                        child: Text(
                          'By continuing you accept our Privacy Policy and \nTerm of Use',
                          style:
                              TextStyle(color: TColor.blackColor, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.4,
                ),
                RoundButton(
                    title: 'Register',
                    onpressed: () {
                      //todo Button register
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompleteProfile()));
                    }),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      " Or ",
                      style: TextStyle(fontSize: 10, color: TColor.blackColor),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: TColor.white,
                            border: Border.all(
                                width: 1, color: TColor.gray.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          "assets/images/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: TColor.white,
                            border: Border.all(
                                width: 1, color: TColor.gray.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInView()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 14,
                            color: TColor.gray,
                          ),
                        ),
                        Text(
                          ' Login',
                          style: TextStyle(
                              fontSize: 14,
                              color: TColor.gray,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
