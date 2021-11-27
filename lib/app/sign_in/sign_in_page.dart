import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:symptom_tracker/app/sign_in/sign_in_manager.dart';
import 'package:symptom_tracker/app/sign_in/sign_in_button.dart';
import 'package:symptom_tracker/app/sign_in/social_sign_in.dart';
import 'package:symptom_tracker/common_widgets/alert_dialog.dart';

import '../../services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.manager, required this.isLoading})
      : super(key: key);

  final SignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) =>
                SignInPage(manager: manager, isLoading: isLoading.value),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        showAlertDialog(
          context,
          title: 'Sign in failed',
          content: e.message.toString(),
          defaultActionText: 'OK',
        );
      }
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Tracker'),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(child: _buildHeader(), height: 50),
          const SizedBox(height: 40.0),
          SocialSignInButton(
            image: 'google-logo.png',
            text: 'Sign in with Google',
            onPressed: () => _signInWithGoogle(context),
            onPrimary: Colors.black87,
            primary: Colors.white,
          ),
          const SizedBox(height: 8.0),
          SignInButton(
              child: const Text('Sign in with email'),
              primary: Colors.teal,
              onPrimary: Colors.white,
              onPressed: () => _signInWithEmail(context)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
