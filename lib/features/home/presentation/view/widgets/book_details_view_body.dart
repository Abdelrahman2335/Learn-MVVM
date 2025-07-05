import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 10,
          ),
          child: CustomAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.x),
            ),
            actions: const Icon(FontAwesomeIcons.cartShopping),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.20),
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 30),
        const Text('The Jungle Book', style: Styles.textStyle30),
        const SizedBox(height: 9),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),

        const SizedBox(height: 16),

        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
