part of 'top_books_cubit.dart';

sealed class TopBooksState extends Equatable {
  const TopBooksState();

  @override
  List<Object> get props => [];
}

final class TopBooksInitial extends TopBooksState {}

final class TopBooksLoading extends TopBooksState {}

final class TopBooksFailure extends TopBooksState {

  
  final String errorMessage;

  const TopBooksFailure(this.errorMessage);
}

final class TopBooksSuccess extends TopBooksState {
  final List<BookModel> books;

  const TopBooksSuccess(this.books);
}
