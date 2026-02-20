import 'package:bmi/brain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalcBrain', () {
    test('calculates BMI correctly', () {
      final brain = CalcBrain(weight: 70, height: 175);
      expect(brain.calculate(), '22.9');
    });

    test('returns Normal for healthy BMI', () {
      final brain = CalcBrain(weight: 70, height: 175);
      expect(brain.getResult(), 'Normal');
    });

    test('returns Underweight for low BMI', () {
      final brain = CalcBrain(weight: 45, height: 175);
      expect(brain.getResult(), 'Underweight');
    });

    test('returns Overweight for high BMI', () {
      final brain = CalcBrain(weight: 90, height: 175);
      expect(brain.getResult(), 'Overweight');
    });

    test('returns Obese for very high BMI', () {
      final brain = CalcBrain(weight: 120, height: 175);
      expect(brain.getResult(), 'Obese');
    });

    test('boundary: BMI exactly 18.5 is Normal', () {
      // weight = 18.5 * (1.70)^2 ≈ 53.5 kg
      final brain = CalcBrain(weight: 54, height: 170);
      expect(brain.getResult(), 'Normal');
    });

    test('getMeaning returns non-empty string', () {
      final brain = CalcBrain(weight: 70, height: 175);
      expect(brain.getMeaning(), isNotEmpty);
    });
  });
}
