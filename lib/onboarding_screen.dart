import 'package:billy_todo/intro_screens/intro_page_1.dart';
import 'package:billy_todo/intro_screens/intro_page_2.dart';
import 'package:billy_todo/intro_screens/intro_page_3.dart';
import 'package:billy_todo/papes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ]),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 20.0, fontFamily: 'IndieFlower'),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ));
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: 'IndieFlower'),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Next',
                            style: TextStyle(
                                fontSize: 20.0, fontFamily: 'IndieFlower')),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
