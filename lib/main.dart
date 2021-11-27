import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_tracker/app/pages/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:symptom_tracker/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Symptom Tracker',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: LandingPage(),
      ),
    );
  }
}
