import 'package:coffee_shop/screens/black_gold.dart';
import 'package:coffee_shop/screens/cold_brew.dart';
import 'package:coffee_shop/screens/gold_brew.dart';
import 'package:coffee_shop/screens/nescfe.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var _selectedOption = 0;
  List allOptions = [BlackGold(), ColdBrew(), Nescafe(), GoldBrew()];
  List isSelected = [true, false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent),
        Container(
          height: screenHeight,
          width: screenWidth / 5,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        Positioned(
            left: screenWidth / 5,
            child: Container(
              height: screenHeight,
              width: screenWidth - (screenWidth / 5),
              color: const Color.fromARGB(224, 201, 199, 196),
            )),
        const Positioned(
            top: 35.0,
            left: 20.0,
            child: Icon(Icons.menu, color: Color.fromARGB(255, 10, 0, 0))),
        const Positioned(
            top: 35.0,
            right: 20.0,
            child: Icon(
              Icons.shopping_bag,
              color: Color.fromARGB(255, 80, 80, 78),
            )),
        Positioned(
          top: screenHeight - (screenHeight - 100.0),
          left: (screenWidth / 5) + 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('HamroCoffee',
                  style: TextStyle(fontSize: 30, color: Colors.black)),
              const Text(
                'The best way to start your day!',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 40,
                width: 225,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'Search Coffee',
                  ),
                ),
              ),
            ],
          ),
        ),
        buildSideNavigator(),
        Positioned(
            top: (screenHeight / 3) + 5.0,
            left: (screenWidth / 5) + 25.0,
            child: SizedBox(
                height: screenHeight - ((screenHeight / 3) + 50.0),
                width: screenWidth - ((screenWidth / 5) + 40.0),
                child: allOptions[_selectedOption]))
      ],
    ));
  }

  buildSideNavigator() {
    return Positioned(
        top: 75.0,
        child: RotatedBox(
            quarterTurns: 3,
            child: SizedBox(
                width: MediaQuery.of(context).size.height - 100.0,
                height: MediaQuery.of(context).size.width / 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOption('Black Gold', 0),
                      buildOption('Cold Brew', 1),
                      buildOption('Nescafe', 2),
                      buildOption('Gold Brew', 3),
                    ]))));
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8.0,
                width: 8.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF23163D)))
            : Container(
                height: 8.0,
                width: 8.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent)),
        const SizedBox(height: 5.0),
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedOption = index;
                isOptionSelected(index);
              });
            },
            child: Text(
              title,
            ))
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
