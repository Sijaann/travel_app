import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/intro_screens/intro1.dart';
import 'package:travel_app/screens/intro_screens/intro2.dart';
import 'package:travel_app/screens/intro_screens/intro3.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  //to keep track of which page we are in
  PageController _controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip button
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Container(
                    height: 35,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange),
                    child: Center(child: Text("Skip")),
                  ),
                ),

                //page slider indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //next/dont button
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        },
                        child: Container(
                          height: 35,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange),
                          child: const Center(child: Text("Done")),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          height: 35,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange),
                          child: const Center(child: Text("Next")),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
