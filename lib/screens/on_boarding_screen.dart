import 'package:flutter/material.dart';

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
      body: PageView.builder(
          scrollDirection: Axis.vertical,
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
                padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
                child: Column(
                  children: [],
                ),
              ),
            );
          }),
    );
  }
}
