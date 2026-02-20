import 'package:bmi/brain.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/customw.dart';
import 'package:bmi/icon.dart';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kactivecolor
                        : kinactivecolor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    customw: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kactivecolor
                        : kinactivecolor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    customw: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kactivecolor,
              onPress: () {},
              customw: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: klabeltextstyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kheightstyle),
                      Text(' cm', style: kcmstyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactivecolor,
                    onPress: () {},
                    customw: _CounterWidget(
                      label: 'WEIGHT',
                      value: weight,
                      unit: 'kg',
                      onIncrease: () => setState(() => weight++),
                      onDecrease: () => setState(() {
                        if (weight > 1) weight--;
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactivecolor,
                    onPress: () {},
                    customw: _CounterWidget(
                      label: 'AGE',
                      value: age,
                      onIncrease: () => setState(() => age++),
                      onDecrease: () => setState(() {
                        if (age > 1) age--;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              final CalcBrain calc =
                  CalcBrain(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiResult: calc.calculate(),
                    resultText: calc.getResult(),
                    mean: calc.getMeaning(),
                  ),
                ),
              );
            },
            child: Container(
              color: kbottomcontainercolor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kbottomcontainer,
              child: const Center(
                child: Text(
                  'CALCULATE BMI',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  const _CounterWidget({
    required this.label,
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
    this.unit,
  });

  final String label;
  final int value;
  final String? unit;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: klabeltextstyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value.toString(), style: kweightstyle),
            if (unit != null)
              Text(' $unit', style: kcmstyle.copyWith(fontSize: 18)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: '${label}_minus',
              onPressed: onDecrease,
              mini: true,
              child: const Icon(FontAwesomeIcons.minus),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: '${label}_plus',
              onPressed: onIncrease,
              mini: true,
              child: const Icon(FontAwesomeIcons.plus),
            ),
          ],
        ),
      ],
    );
  }
}
