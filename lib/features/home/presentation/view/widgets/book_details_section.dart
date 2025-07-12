import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/view/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.28),
          child: CustomBookImage(
            imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 30),
        Text(
          book.volumeInfo!.title!,
          style: Styles.textStyle20,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 9),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo!.authors?.join(', ') ?? 'Unknown Author',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),

        const BookRating(mainAxisAlignment: MainAxisAlignment.center),

        const SizedBox(height: 37),
        BooksAction(book: book),
      ],
    );
  }
}
