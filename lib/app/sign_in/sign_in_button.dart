import 'package:flutter/material.dart';
import 'package:symptom_tracker/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  const SignInButton({
    Key? key,
    required Widget child,
    required Color primary,
    required Color onPrimary,
    required VoidCallback onPressed,
  }) : super(
            child: child,
            primary: primary,
            onPressed: onPressed,
            onPrimary: onPrimary);
}
