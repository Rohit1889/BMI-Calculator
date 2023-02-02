import 'package:test_rohit_apk/constants/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:test_rohit_apk/widgets/left_bar.dart';
import 'package:test_rohit_apk/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var msg;
  final _height = TextEditingController();
  final _weight = TextEditingController();
  void calculate() {
    double _h = double.parse(_height.text) / 100;
    double _w = double.parse(_weight.text);
    var _bmiResult;
    setState(() {
      _bmiResult = _w / (_h * _h);
      if (_bmiResult > 25) {
        msg = "You\'re over weight";
      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
        msg = "You\'ve normal weight";
      } else
        msg = "You\'re under weight";
    });

    debugPrint("calculate function is called with $msg!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 200,
                    child: Center(
                      child: TextField(
                        controller: _height,
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w300,
                            color: accentHexColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Height(cm)",
                            hintStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.8))),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 200,
                    child: Center(
                      child: TextField(
                        controller: _weight,
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentHexColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Weight(Kg)",
                            hintStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.8))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    calculate();
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: 30),
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "$msg",
                style: TextStyle(fontSize: 32, color: Colors.blueAccent),
              ),
              SizedBox(
                height: 50,
              ),
              LeftBar(barWidth: 20),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 50),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 80),
              SizedBox(
                height: 50,
              ),
              RightBar(barWidth: 90),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 50),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 20),
              SizedBox(
                height: 50,
              ),
              LeftBar(barWidth: 20),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 50),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 80),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
