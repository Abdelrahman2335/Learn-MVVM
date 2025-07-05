import 'package:bookly/features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
          child: const BestSellerListViewItem(),
        );
      }, childCount: 10),
    );
  }
}
