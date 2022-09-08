import 'package:flutter/material.dart';

enum RoundI {
  plus,
  minus,
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({required this.icon, required this.onPressF});
  final IconData icon;
  final VoidCallback onPressF;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressF,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF222747),
      shape: CircleBorder(),
    );
  }
}
