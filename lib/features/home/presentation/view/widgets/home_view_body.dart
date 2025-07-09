import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/top_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                leading: Image.asset(AssetsData.logo, height: 18),
                actions: IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSearchView);
                  },
                  icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
                ),
              ),
              const TopBooksListView(),
              const SizedBox(height: 51),
              const Padding(
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
