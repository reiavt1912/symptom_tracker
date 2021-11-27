import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:symptom_tracker/common_widgets/alert_dialog.dart';

Future<void> showExceptionAlertDialog(
  BuildContext context, {
  required String title,
  required Exception exception,
}) =>
    showAlertDialog(
      context,
      title: title,
      content: exception.toString(),
      defaultActionText: 'OK',
    );
