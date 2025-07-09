import 'package:bookly/core/utils/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtom(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            buttonText: "19.99€",
            onPressed: () {},
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          CustomButtom(
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            buttonText: "Free Preview",
            onPressed: () {},
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
