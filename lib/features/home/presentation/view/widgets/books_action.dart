import 'package:bookly/core/functions/launch_url.dart';
import 'package:bookly/core/widgets/custom_buttom.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtom(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            buttonText: "Free",
            onPressed: () {},
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          CustomButtom(
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            buttonText: getText(book),
            onPressed: () async {
              launchCustomUrl(context, book.volumeInfo!.previewLink ?? '');
            },
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            fontSize: 16,
          ),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo!.previewLink == null ||
        book.volumeInfo!.previewLink!.isEmpty) {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
