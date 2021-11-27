import 'package:flutter/material.dart';
import 'package:symptom_tracker/app/sign_in/email_sign_in_change_model.dart';
import 'package:symptom_tracker/app/sign_in/email_sign_in_form_bloc_based.dart';
import 'package:symptom_tracker/app/sign_in/email_sign_in_form_change_notifier.dart';
import 'package:symptom_tracker/app/sign_in/email_sign_in_form_stateful.dart';
import 'package:symptom_tracker/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInFormChangeNotifier.create(context),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
