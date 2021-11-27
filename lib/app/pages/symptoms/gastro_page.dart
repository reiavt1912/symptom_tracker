import 'package:flutter/material.dart';
import 'package:symptom_tracker/common_widgets/rating_card.dart';

class GastroPage extends StatelessWidget {
  const GastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gastrointestinal Symptoms',
        ),
        centerTitle: true,
      ),
      body: Column(
        children:  const [
          CustomRatingBar(
            text: 'Bloating',
          ),
          CustomRatingBar(
            text: 'Gas',
          ),
          CustomRatingBar(
            text: 'Constipation',
          ),
          CustomRatingBar(
            text: 'Loose Stool',
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
