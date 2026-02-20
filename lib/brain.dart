import 'dart:math' show pow;

class CalcBrain {
  CalcBrain({
required this.weight, required this.height});

  final int weight;
  final int height;

  late final double _bmi = _calculateBMI();

  double _calculateBMI() {
    return weight / pow(height / 100, 2);
  }

  
String calculate() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30.0) {
      return 'Obese';
    } else if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getMeaning() {
    switch (getResult()) {
      case 'Obese':
        return 'You are obese. Please consult a doctor and consider a structured diet and exercise plan.';
      case 'Overweight':
        return 'You have a higher than normal body weight. Try to exercise more and watch your diet.';
      case 'Normal':
        return 'Great! You have a healthy BMI. Keep it up!';
      case 'Underweight':
        return 'You are underweight. Try to eat a bit more and consult a nutritionist if needed.';
      default:
        return '';
    }
  }
}
