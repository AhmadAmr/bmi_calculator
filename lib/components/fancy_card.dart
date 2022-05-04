import 'package:flutter/material.dart';

class FancyCard extends StatelessWidget {
  final Color colour;
  final Widget? child;
  final VoidCallback? onPress;

  const FancyCard({required this.colour, this.child,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
