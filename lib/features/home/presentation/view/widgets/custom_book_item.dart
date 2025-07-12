import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => GoRouter.of(
            context,
          ).push(AppRouter.kBookDetailsView, extra: book),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          children: [
            SizedBox(
              child: CustomBookImage(
                imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,

                    child: Text(
                      book.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.volumeInfo!.authors!.isNotEmpty
                        ? book.volumeInfo!.authors![0]
                        : "Unknown Author",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),

                  Row(
                    children: [
                      Text(
                        "Free",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
