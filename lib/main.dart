import 'package:billy_todo/onboarding_screen.dart';
// import 'package:billy_todo/papes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class SplashScrren extends StatelessWidget {
  const SplashScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

