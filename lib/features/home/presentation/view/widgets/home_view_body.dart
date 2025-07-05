import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/top_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomAppBar(),
              TopBooksListView(),
              SizedBox(height: 51),
              Padding(
                padding: EdgeInsets.only(left: 30.0, bottom: 10),
                child: Text("Best Sellers", style: Styles.textStyle18),
              ),
            ],
          ),
        ),
        const BestSellerListView(),
      ],
    );
  }
}
