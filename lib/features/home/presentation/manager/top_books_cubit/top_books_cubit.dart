import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'top_books_state.dart';

class TopBooksCubit extends Cubit<TopBooksState> {
  TopBooksCubit(this.homeRepo) : super(TopBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTopBooks() async {
    emit(TopBooksLoading());

    var result = await homeRepo.fetchTopBooks();

    result.fold(
      (failure) => emit(TopBooksFailure(failure.errorMessage)),
      (books) => emit(TopBooksSuccess(books)),
    );
  }
}
