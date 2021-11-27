import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_tracker/app/pages/home_page.dart';
import 'package:symptom_tracker/app/sign_in/sign_in_page.dart';
import 'package:symptom_tracker/services/auth.dart';
import 'package:symptom_tracker/services/database.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return Provider<Database>(
                create: (_) => FirestoreDatabase(uid: user.uid),
                child: HomePage());
          }
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}
