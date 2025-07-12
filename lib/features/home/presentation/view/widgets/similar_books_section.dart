import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You can also like",
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    state is SimilarBooksSuccess ? state.books.length : 0,
                itemBuilder: (context, index) {
                  if (state is SimilarBooksSuccess) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CustomBookImage(
                        imageUrl:
                            state
                                .books[index]
                                .volumeInfo
                                ?.imageLinks
                                ?.thumbnail ??
                            '',
                      ),
                    );
                  } else if (state is SimilarBooksFailure) {
                    return CustomErrorWidget(errorMessage: state.errorMessage);
                  } else {
                    return const CustomLoadingIndicator();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
