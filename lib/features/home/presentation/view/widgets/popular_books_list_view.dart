import 'dart:developer';

import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/popular_books_cubit/popular_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularBooksListView extends StatelessWidget {
  const PopularBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBooksCubit, PopularBooksState>(
      builder: (context, state) {
        if (state is PopularBooksSuccess) {
          log("Popular Books Loaded: ${state.books.length} books");
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,

            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks?.thumbnail ?? '',
                  ),
                );
              },
            ),
          );
        } else if (state is PopularBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLaondingIndicator();
        }
      },
    );
  }
}
