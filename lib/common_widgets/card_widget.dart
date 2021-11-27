import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {Key? key,
      required this.text,
      required this.onPressedNo,
      required this.onPressedYes})
      : super(key: key);
  final String text;
  final VoidCallback onPressedNo;
  final VoidCallback onPressedYes;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(text),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onPressedYes,
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: onPressedNo,
                  child: const Text('No'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
