import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class ReachResult extends StatelessWidget {
  const ReachResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
          child: const CustomBookItem(book: BookModel()),
        );
      }, childCount: 10),
    );
  }
}
