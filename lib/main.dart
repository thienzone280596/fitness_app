import 'package:fitness_app/common/color_extention.dart';
import 'package:fitness_app/views/onboarding/started_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Poppins",
          primaryColor: TColor.primaryColor1),
      home: const StartedView(),
    );
  }
}
