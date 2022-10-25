import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_large_text.dart';
import 'package:travel_app/utils/app_text.dart';
import 'package:travel_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menue and user Icon
            Container(
              //padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //Discover Text
            AppLargeText(text: "Discover"),
            SizedBox(
              height: 30,
            ),

            //horizontal tabbar kind of thing
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  tabs: [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspirations",
                    ),
                    Tab(
                      text: "Emotions",
                    )
                  ],
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(right: 40, left: 0),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.only(left: -25, right: 15),
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("images/mountain.jpg"),
                                fit: BoxFit.cover),
                          ),
                        );
                      }),
                  Text("HELLO"),
                  Text("BYE"),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore More",
                    size: 22,
                  ),
                  AppText(
                    text: "See all",
                    color: AppColors.textColor1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                            //margin: const EdgeInsets.only(right: 50),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("images/mountain.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            child: AppText(
                              text: "Kayaking",
                              color: AppColors.textColor2,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

//for the cicrular indicator below the tabbar

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
