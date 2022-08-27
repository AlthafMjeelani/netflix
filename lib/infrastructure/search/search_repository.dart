import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/core/api_endpoints.dart';
import 'package:netflixapp/domain/search/i_serch_repo.dart';
import 'package:netflixapp/domain/search/models/search_response/search_response.dart';

@LazySingleton(as: SearchService)
class SearchRepositoryService implements SearchService {
  @override
  Future<Either<MainFailures, SearchResponse>> serchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchList = SearchResponse.fromJson(response.data);
        return Right(searchList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clintFailure());
    }
  }
}
