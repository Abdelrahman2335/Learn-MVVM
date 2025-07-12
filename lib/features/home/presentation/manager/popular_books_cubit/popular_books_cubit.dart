import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'popular_books_state.dart';

class PopularBooksCubit extends Cubit<PopularBooksState> {
  PopularBooksCubit(this.homeRepo) : super(PopularBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularBooks() async {
    emit(PopularBooksLoading());

    var result = await homeRepo.fetchPopularBooks();

    result.fold(
      (failure) => emit(PopularBooksFailure(failure.errorMessage)),
      (books) => emit(PopularBooksSuccess(books)),
    );
  }
}
