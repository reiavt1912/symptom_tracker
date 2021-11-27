import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_tracker/app/pages/symptoms/gastro_page.dart';
import 'package:symptom_tracker/app/pages/symptoms/muscle_page.dart';
import 'package:symptom_tracker/app/pages/symptoms/neurological_page.dart';
import 'package:symptom_tracker/common_widgets/alert_dialog.dart';
import 'package:symptom_tracker/common_widgets/card_widget.dart';
import 'package:symptom_tracker/services/auth.dart';
import 'package:symptom_tracker/services/database.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
      auth.currentUser;
      // onSignOut({FirebaseAuth.instance.currentUser});
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _confirmSightOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(context,
        title: 'Logout',
        content: 'Are you sure that you want to logout?',
        cancelActionText: 'Cancel',
        defaultActionText: 'Logout');
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Future<void> _createSystem(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await database.createJob({
      'system': 'Neurological',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptoms'),
        centerTitle: true,
        elevation: 2.0,
        actions: <Widget>[
          TextButton(
            onPressed: () => _confirmSightOut(context),
            child: const Text('Logout'),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Today I am experiencing...',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            CustomCardWidget(
              text: 'Neurological Symptoms',
              onPressedYes: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NeuroPage()),
                );
              },
              onPressedNo: () {},
            ),
            const SizedBox(
              height: 12.0,
            ),
            CustomCardWidget(
                text: 'Gastrointestinal Symptoms',
                onPressedYes: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GastroPage()),
                  );
                },
                onPressedNo: () {}),

            const SizedBox(
              height: 12.0,
            ),
            CustomCardWidget(
                text: 'Musculoskeletal Symptoms',
                onPressedYes: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MusclePage()),
                  );
                },
                onPressedNo: () {}),
            const SizedBox(
              height: 12.0,
            ),

            //todo add other systems that are affected
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _createSystem(context),
          label: const Text('Add Another')),
    );
  }
}
