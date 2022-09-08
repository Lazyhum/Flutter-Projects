import 'package:bmi_calculator/screens/main.dart';
import 'package:flutter/cupertino.dart';

class MyCard extends StatelessWidget {
  MyCard({this.colour, this.cardChild, this.onPress});
  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: cardChild,
        onTap: onPress,
      ),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
