import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_buttons.dart';
import 'package:travel_app/utils/app_large_text.dart';
import 'package:travel_app/utils/app_text.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/utils/responsive_button.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            //Image on Background
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/mountain3.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),

            //MEnue Buttons on either SIde
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 260,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert_rounded),
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Pokhara and $250 text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Jomsome",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "\$250",
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    //Location TExt
                    Row(
                      children: [
                        //Location Icon
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),

                        //Nepal, Kaski
                        AppText(
                          text: "Nepal, Mustang",
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      children: [
                        //Rating Stars
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          }),
                        ),

                        SizedBox(
                          width: 10.0,
                        ),

                        //Rating Text
                        AppText(
                          text: "(4.0)",
                          color: AppColors.textColor2,
                        )
                      ],
                    ),

                    SizedBox(
                      height: 25.0,
                    ),

                    //People TExt
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20.0,
                    ),

                    SizedBox(
                      height: 5.0,
                    ),

                    //Number of people in your group TEXT
                    AppText(
                      text: "Number of people in your gorup",
                      color: AppColors.mainTextColor,
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    //1 2 3 4 5 Button
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.2),
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.2),
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    //Description TEXT
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    //Long Description TEXT
                    AppText(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.",
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 15,
              right: 10,
              child: Row(
                children: [
                  //Favourite Button
                  AppButtons(
                    size: 60,
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),

                  SizedBox(
                    width: 15,
                  ),

                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.mainColor),
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Confirm Booking'),
                          content:
                              const Text('Do you want to confirm booking?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                                final snackBar = SnackBar(
                                  backgroundColor: AppColors.mainColor,
                                  content: const Text('Booking Canceled'),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                final snackBar = SnackBar(
                                  backgroundColor: AppColors.mainColor,
                                  content: const Text('Booking Confirmed'),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          AppLargeText(
                            text: "Book Now",
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 85,
                          ),
                          Icon(Icons.bookmark_added_sharp)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
