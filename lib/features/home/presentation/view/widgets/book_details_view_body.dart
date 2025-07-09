import 'package:bookly/features/home/presentation/view/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                  bottom: 10,
                ),
                child: CustomAppBar(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.x),
                  ),
                  actions: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.cartShopping),
                  ),
                ),
              ),
              const BookDetailsSection(),

              const Expanded(child: SizedBox(height: 50)),
              const SimilarBooksSection(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
