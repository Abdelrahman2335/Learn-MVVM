import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
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
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(FontAwesomeIcons.x, size: 20),
                  ),
                  actions: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.cartShopping, size: 20),
                  ),
                ),
              ),
              BookDetailsSection(book: book),

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
