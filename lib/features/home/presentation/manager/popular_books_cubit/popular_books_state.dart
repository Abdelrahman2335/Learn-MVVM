part of 'popular_books_cubit.dart';

sealed class PopularBooksState extends Equatable {
  const PopularBooksState();

  @override
  List<Object> get props => [];
}

final class PopularBooksInitial extends PopularBooksState {}

final class PopularBooksLoading extends PopularBooksState {}

final class PopularBooksFailure extends PopularBooksState {
  final String errorMessage;

  const PopularBooksFailure(this.errorMessage);
}

final class PopularBooksSuccess extends PopularBooksState {
  final List<BookModel> books;

  const PopularBooksSuccess(this.books);
}
