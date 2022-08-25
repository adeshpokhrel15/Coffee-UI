import 'package:coffee_shop/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors_palette.dart';

class ColdBrew extends StatefulWidget {
  @override
  _ColdBrewState createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      buildListItem('assets/coffee4.png', '550', ColorPalette().secondSlice),
      buildListItem('assets/coffee2.png', '900', ColorPalette().firstSlice)
    ]);
  }

  buildListItem(String imgPath, String price, Color bgColor) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  CoffeeDetails(imgPath: imgPath, headerColor: bgColor)));
        },
        child: Stack(
          children: [
            Container(
                height: 300.0,
                width: 250.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.transparent)),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: const DecorationImage(
                            image: AssetImage('assets/doodle.png'),
                            fit: BoxFit.none)))),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white.withOpacity(0.6),
                    ))),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: bgColor.withOpacity(0.9),
                    ))),
            Positioned(
                right: 2.0,
                child: Hero(
                    tag: imgPath,
                    child: SizedBox(
                        height: 250.0,
                        width: 150.0,
                        child: Image(
                            image: AssetImage(imgPath),
                            fit: BoxFit.scaleDown)))),
            Positioned(
                top: 125.0,
                left: 15.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price',
                        style:
                            TextStyle(color: Color(0xFF23163D), fontSize: 20.0),
                      ),
                      Text(
                        'Rs. $price',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 40.0),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Grady\'s COLD BREW',
                        style:
                            TextStyle(color: Color(0xFF23163D), fontSize: 27.0),
                      ),
                      const SizedBox(height: 2.0),
                      SizedBox(
                          width: 200.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '70 reviews',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                    ]),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        width: 75.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.add, size: 17.0),
                                              SizedBox(width: 5.0),
                                              Text(
                                                'Add',
                                                style: TextStyle(
                                                    color: Color(0xFF23163D),
                                                    fontSize: 15.0),
                                              )
                                            ])))
                              ]))
                    ]))
          ],
        ));
  }
}
