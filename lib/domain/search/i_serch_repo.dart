import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/search/models/search_response/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResponse>> serchMovies({
    required String movieQuery,
  });
}
