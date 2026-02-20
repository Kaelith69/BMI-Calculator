import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi/input_page.dart';

void main() => runApp(const BMIcalculator());

class BMIcalculator extends StatelessWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.robotoTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF0a001a),
        appBarTheme: const AppBarTheme(elevation: 10,
        color: Color(0xff1e0b54),),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 20,
        backgroundColor: Colors.white54),
      ),
      home: const InputPage(),
    );
  }
}
