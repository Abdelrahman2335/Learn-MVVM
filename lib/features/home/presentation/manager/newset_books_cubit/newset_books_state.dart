part of 'newset_books_cubit.dart';

sealed class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBooksLoading extends NewsetBooksState {}

final class NewsetBooksFailure extends NewsetBooksState {
  const NewsetBooksFailure(this.errorMessage);

  final String errorMessage;
}

final class NewsetBooksSuccess extends NewsetBooksState {
  const NewsetBooksSuccess(this.books);

  final List<BookModel> books;
}
