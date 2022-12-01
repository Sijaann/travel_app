import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_large_text.dart';
import 'package:travel_app/utils/app_text.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/utils/responsive_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //List of images
  List images = ["intro_page1.jpg", "intro_page2.jpg", "intro_page3.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Large Text "Trip"
                          AppLargeText(text: "Trips"),

                          //App Text "Mou"
                          AppText(
                            text: "Mountain",
                            size: 30.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          //Small Text below Big Text
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
                          SizedBox(
                            height: 10.0,
                          ),
                          ResponsiveButton(),
                        ],
                      ),

                      //Page Indicator
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2.0),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.3),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    ));
  }
}
