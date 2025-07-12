import 'dart:developer';

import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl._(this.apiService);

  static final HomeRepoImpl _instance = HomeRepoImpl._(ApiService());

  factory HomeRepoImpl() => _instance;

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtering-free-ebooks&Sorting=newest &q=subject:computer science",
      );

      List<BookModel> books =
          (data['items'] as List)
              .map((book) => BookModel.fromJson(book))
              .toList();

      return right(books);
    } on Exception catch (error) {
      log("Error fetching newest books: $error");

      if (error is DioException) {
        Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchPopularBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "volumes? Filtering-free-ebooks&q=subject:Programming",
      );

      List<BookModel> books =
          (data['items'] as List)
              .map((book) => BookModel.fromJson(book))
              .toList();

      return right(books);
    } on Exception catch (error) {
      log("Error fetching newest books: $error");

      if (error is DioException) {
        Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtering-free-ebooks&Sorting=relevance&q=subject:Programming",
      );

      List<BookModel> books =
          (data['items'] as List)
              .map((book) => BookModel.fromJson(book))
              .toList();

      return right(books);
    } on Exception catch (error) {
      log("Error fetching newest books: $error");

      if (error is DioException) {
        Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
