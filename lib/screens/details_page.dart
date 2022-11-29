import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/mountain.jpg"),
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
                    onPressed: () {},
                    icon: Icon(Icons.menu),
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
          ],
        ),
      ),
    );
  }
}
