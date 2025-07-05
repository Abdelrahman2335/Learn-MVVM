import 'package:bookly/features/home/presentation/view/widgets/custom_book.dart';
import 'package:flutter/material.dart';

class TopBooksListView extends StatelessWidget {
  const TopBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}
