import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final IconData? icon;
  const RoundButton({this.onPressed,this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        shape: const CircleBorder(),
        color: const Color(0xFF4C4F5E),
        minWidth: 56.0,
        height: 56.0,
        elevation: 5.0,
        child: Icon(icon),
    );
  }
}

