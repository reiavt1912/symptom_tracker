import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key? key,
    required this.child,
    required this.primary,
    this.borderRadius = 2.0,
    this.height = 50.0,
    required this.onPressed,
    required this.onPrimary,
  });
  final Widget child;
  final Color primary;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;
  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(primary: primary, onPrimary: onPrimary),
        onPressed: onPressed,
      ),
    );
  }
}
