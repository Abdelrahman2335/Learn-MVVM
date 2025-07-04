import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/top_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomAppBar(),
        Padding(
          padding: EdgeInsets.only(right: 18),
          child: TopBooksListView(),
        ),
         SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text("Best Sellers", style: Styles.titleMediam),
        ),
      ],
    );
  }
}
