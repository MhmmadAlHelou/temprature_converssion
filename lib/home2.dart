// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  double fahTemp = 0.0, celTemp = 0.0;
  bool isFah = true;
  String temp = 'F';
  var temperatures = ['Celsius', 'Fahrenhiet'];
  var selectedTemp1 = 'Celsius';
  var selectedTemp2 = 'Fahrenhiet';
  var fahController = TextEditingController();
  var celController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fahController.addListener(fahListener);
    fahController.text = fahTemp.toString();
    celController.addListener(celListener);
    //  celController.text = celTemp.toString();
  }

  fahListener() {
    fahTemp = double.parse(fahController.text);
    celTemp = convert(fahTemp, true);
    if (isFah) celController.text = celTemp.toString();
    isFah = true;
    temp = 'F';
  }

  celListener() {
    celTemp = double.parse(celController.text);
    fahTemp = convert(celTemp, false);
    if (!isFah) fahController.text = fahTemp.toString();
    isFah = false;
    temp = 'C';
  }

  double convert(double temp, bool isFah) {
    return isFah ? (temp - 32) * (5 / 9) : (temp * 9 / 5) + 32;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temprature')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                DropdownButton(
                  items: temperatures.map((item) {
                    return DropdownMenuItem(
                      child: Text(item),
                      value: item,
                    );
                  }).toList(),
                  value: selectedTemp1,
                  onChanged: (newValue) {
                    setState(() {
                      selectedTemp1 = newValue.toString();
                    });
                    if (newValue == temperatures[0]) {
                      setState(() {
                        isFah = false;
                        temp = 'C';
                      });
                    } else {
                      setState(() {
                        isFah = true;
                        temp = 'F';
                      });
                    }
                  },
                ),
                TextField(
                  controller: celController,
                  decoration: InputDecoration(suffixText: temp),
                  keyboardType: TextInputType.number,
                ),
              ],
            )),
            SizedBox(width: 40),
            Expanded(
                child: Column(
              children: [
                DropdownButton(
                  items: temperatures.map((item) {
                    return DropdownMenuItem(
                      child: Text(item),
                      value: item,
                    );
                  }).toList(),
                  value: selectedTemp2,
                  onChanged: (newValue) {
                    setState(() {
                      selectedTemp2 = newValue.toString();
                    });
                    if (newValue == temperatures[0]) {
                      setState(() {
                        isFah = false;
                        temp = 'F';
                      });
                    } else {
                      setState(() {
                        isFah = true;
                        temp = 'C';
                      });
                    }
                  },
                ),
                TextField(
                  controller: fahController,
                  decoration: InputDecoration(suffixText: temp),
                  keyboardType: TextInputType.number,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
