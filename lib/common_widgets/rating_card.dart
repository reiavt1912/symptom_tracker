import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  RatingBar.builder(
                      itemSize: 25,
                      initialRating: 10,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 10,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                            Icons.favorite,
                            color: Colors.pinkAccent,
                          ),
                      onRatingUpdate: (rating) {
                        //print(rating);
                      }),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
