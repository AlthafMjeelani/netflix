import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/core/api_endpoints.dart';
import 'package:netflixapp/domain/search/i_serch_repo.dart';
import 'package:netflixapp/domain/search/models/search_response/search_response.dart';

@LazySingleton(as: ISearchFazard)
class SearchRepository implements ISearchFazard {
  @override
  Future<Either<MainFailures, SearchResponse>> getSearchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchResult = SearchResponse.fromJson(response.data);
        return Right(searchResult);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clintFailure());
    }
  }
}
