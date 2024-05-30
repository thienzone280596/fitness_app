import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/common_widget/round_button.dart';
import 'package:fitness_app/common_widget/round_textfield.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Hey There',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.blackColor, fontSize: 16),
                ),
                Text(
                  'Welcome Back',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Expanded(
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.7,
                ),
                RoundButton(
                    title: 'Login',
                    onpressed: () {
                      //todo Button register
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const CompleteProfile()));
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
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Don’t have an account yet?',
                          style: TextStyle(
                            fontSize: 14,
                            color: TColor.gray,
                          ),
                        ),
                        Text(
                          'Register',
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
