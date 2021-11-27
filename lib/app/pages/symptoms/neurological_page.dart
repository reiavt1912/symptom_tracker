import 'package:flutter/material.dart';
import 'package:symptom_tracker/common_widgets/rating_card.dart';

class NeuroPage extends StatelessWidget {
  const NeuroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Neurological Symptoms',
        ),
        centerTitle: true,
      ),
      body: Column(
        children:  const [
          CustomRatingBar(
            text: 'Fatigue',
          ),
          CustomRatingBar(
            text: 'Headache',
          ),
          CustomRatingBar(
            text: 'Numbness Tingling',
          ),
          CustomRatingBar(
            text: 'Spacial Awareness',
          ),
          ],
      ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: const Text('Add Another'),
        ),
    );
  }
}
