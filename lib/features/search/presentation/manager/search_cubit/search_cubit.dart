import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String bookName}) async {
    emit(SearchLoading());
    var reslut = await searchRepo.fetchSearchBooks(bookName: bookName);

    reslut.fold(
      (failure) => emit(SearchFailure(failure.errorMessage)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
