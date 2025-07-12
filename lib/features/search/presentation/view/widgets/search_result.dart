import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
                child: CustomBookItem(book: state.books[index]),
              );
            }, childCount: state.books.length),
          );
        } else if (state is SearchFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        } else if (state is SearchLoading) {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text("Search for some books...")),
          );
        }
      },
    );
  }
}
