import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 159, 204, 187),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text(
            "KEEP YOUR TASKS",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'IndieFlower',
              letterSpacing: 2.0
            ),
          ),

          SizedBox(height: 30),

          Lottie.asset(
            "assets/95434-history.json",
            animate: true,
          ),
          
        ],
      ),
    );
  }
}
