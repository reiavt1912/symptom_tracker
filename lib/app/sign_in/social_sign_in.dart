import 'package:flutter/material.dart';
import 'package:symptom_tracker/app/sign_in/sign_in_button.dart';

class SocialSignInButton extends SignInButton {
  SocialSignInButton({
    Key? key,
    required Color primary,
    required Color onPrimary,
    required VoidCallback onPressed,
    required String image,
    required String text,
  }) : super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/$image'),
                Text(text),
                Opacity(opacity: 0, child: Image.asset('assets/$image')),
              ],
            ),
            primary: primary,
            onPressed: onPressed,
            onPrimary: onPrimary);
}
