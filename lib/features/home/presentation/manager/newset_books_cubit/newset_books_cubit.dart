import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

   final HomeRepo homeRepo;

  Future<void> fetchNewsBooks() async {
    emit(NewsetBooksLoading());

    var result = await homeRepo.fetchNewsetBooks();

    result.fold(
      (failure) => emit(NewsetBooksFailure(failure.errorMessage)),
      (books) => emit(NewsetBooksSuccess(books)),
    );
  }
}


