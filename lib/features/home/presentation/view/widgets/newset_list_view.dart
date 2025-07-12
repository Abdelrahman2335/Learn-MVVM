import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetListView extends StatelessWidget {
  const NewsetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
                child: CustomBookItem(book: state.books[index]),
              );
            }, childCount: 10),
          );
        }
        if (state is NewsetBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        }
        return const SliverToBoxAdapter(child: CustomLoadingIndicator());
      },
    );
  }
}
