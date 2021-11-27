import 'package:flutter/material.dart';
import 'package:symptom_tracker/common_widgets/rating_card.dart';

class MusclePage extends StatelessWidget {
  const MusclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Musculoskeletal Symptoms',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          CustomRatingBar(
            text: 'Joint Pain',
          ),
          CustomRatingBar(
            text: 'Inflammation',
          ),
          CustomRatingBar(
            text: 'Sore muscles',
          ),
          CustomRatingBar(
            text: 'Stiff Joints',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Add Another'),
      ),
    );
  }
}
