import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.mean,
  });

  final String bmiResult;
  final String resultText;
  final String mean;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Your Result',
                style:
                    klabeltextstyle.copyWith(color: Colors.white, fontSize: 35),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xF01D1E33),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        resultText,
                        style: kheightstyle,
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            'Your BMI result is',
                            style: klabeltextstyle.copyWith(
                                color: Colors.tealAccent,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Center(
                          child: Text(
                            bmiResult,
                            style: klabeltextstyle.copyWith(
                                fontSize: 100, fontWeight: FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mean,
                        style: kcmstyle.copyWith(
                            color: const Color(0xC302DEAC),
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Material(
              color: const Color(0xFF230F5F),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(60),
                topLeft: Radius.circular(60),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: const Color(0xE07B00FF),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.deepPurple[100]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



