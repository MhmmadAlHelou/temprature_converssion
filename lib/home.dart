import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double inTemp = 0.0, outTemp = 0.0;
  bool isFah = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temprature')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your temprature',
                labelText: isFah
                    ? "You entered $inTemp Fahrenheit"
                    : "You entered $inTemp Celeius",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                try {
                  setState(() {
                    inTemp = double.parse(value);
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
            RadioListTile(
              title: const Text('Fahrenheit'),
              value: true,
              groupValue: isFah,
              onChanged: (nValue) {
                setState(() {
                  isFah = true;
                });
              },
            ),
            RadioListTile(
              title: const Text('Celeius'),
              value: false,
              groupValue: isFah,
              onChanged: (nValue) {
                setState(() {
                  isFah = false;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  outTemp =
                      isFah ? (inTemp - 32) / (5 / 6) : (inTemp * 9 / 5) + 32;
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('The result'),
                      content: isFah
                          ? Text('$inTemp Fahrenheit = $outTemp Celeius')
                          : Text('$inTemp Celeius = $outTemp Fahrenheit'),
                    ),
                  );
                });
              },
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
