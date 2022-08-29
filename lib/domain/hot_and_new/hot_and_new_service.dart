import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/hot_and_new/model/hot_and_new.dart';

abstract class HotAndNewService {
  Future<Either<MainFailures, HotAndNewRepo>> getHotAndNewMovieData();
  Future<Either<MainFailures, HotAndNewRepo>> getHotAndNewTvData();
}
