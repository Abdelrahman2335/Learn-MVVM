import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/search/data/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

// To make one instance of this class this is called (Singleton Pattern)
  SearchRepoImpl._(this.apiService);

  static final SearchRepoImpl _internal = SearchRepoImpl._(ApiService());

  factory SearchRepoImpl () => _internal;

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String bookName,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtering-free-ebooks&Sorting=newest &q=subject:$bookName",
      );

      List<BookModel> books =
          (data["items"] as List)
              .map((book) => BookModel.fromJson(book))
              .toList();
      return Right(books);
    } on Exception catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
