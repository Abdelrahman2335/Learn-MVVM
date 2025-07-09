
import 'package:bookly/features/home/presentation/view/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class ReachResult extends StatelessWidget {
  const ReachResult({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
              child: const BookListViewItem(),
            );
          }, childCount: 10),
        ),
      ],
    );
  }
}