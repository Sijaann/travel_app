import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/utils/app_large_text.dart';
import 'package:travel_app/utils/app_text.dart';
import 'package:travel_app/utils/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //List of images
  List images = ["intro_page1.jpg", "intro_page2.jpg", "intro_page3.jpg"];

  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _controller,
            itemBuilder: (context, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/" + images[index],
                      ),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, right: 20, left: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "Trips"),
                          AppText(
                            text: "Mountain",
                            size: 30.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 215,
                            child: AppText(
                              text:
                                  "Mountain hikes give you an incredible sense of"
                                  " freedom along with endurance tests",
                              color: AppColors.textColor2,
                              size: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
        Container(
          alignment: Alignment(0.75, -0.55),
          child: SmoothPageIndicator(
              axisDirection: Axis.vertical, controller: _controller, count: 3),
        ),
      ],
    ));
  }
}
