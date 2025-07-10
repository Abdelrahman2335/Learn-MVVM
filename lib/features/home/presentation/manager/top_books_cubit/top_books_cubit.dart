import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'top_books_state.dart';

class TopBooksCubit extends Cubit<TopBooksState> {
  TopBooksCubit() : super(TopBooksInitial());
}
