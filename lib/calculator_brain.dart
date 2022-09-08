import 'dart:math';

class CalculatorBrain {
  late final int height;
  late final int weight;
  late final double _bmi;

  CalculatorBrain({required int height, required int weight}) {
    this.height = height;
    this.weight = weight;
  }
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi >= 25 && _bmi <= 29.9) {
      return 'Overweight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal';
    } else if (_bmi < 18.5) {
      return 'Underweight';
    } else {
      return 'Obese';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25 && _bmi <= 29.9) {
      return 'you have a higher than normal body weight. Sstay healthy by exercising, happy exercising!';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'you have a normal body weight. Stay healthy and keep it up!';
    } else if (_bmi < 18.5) {
      return 'you have a normal body weight, fulfill your cravings freely!';
    } else {
      return 'A higher body weight than normal weight, maintain a diet full or nutrients, happy eating!';
    }
  }
}
