import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          const Icon(
            FontAwesomeIcons.solidStar,
            color: Color(0xffFFDD4F),
            size: 16,
          ),
          const SizedBox(width: 6.3),
          const Text("4.5", style: Styles.textStyle16),
          const SizedBox(width: 5),
          Text(
            "(200)",
            style: Styles.textStyle14.copyWith(color: Color(0xff707070)),
          ),
        ],
      ),
    );
  }
}
