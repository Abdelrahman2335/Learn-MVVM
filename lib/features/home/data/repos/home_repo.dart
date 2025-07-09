import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // Dart does not allow you to use two return types for a single variable
  // Either is used to handle success and failure cases
  // Left side is for failure, Right side is for success
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
