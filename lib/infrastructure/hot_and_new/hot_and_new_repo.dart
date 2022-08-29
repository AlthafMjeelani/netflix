import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/core/api_endpoints.dart';
import 'package:netflixapp/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflixapp/domain/hot_and_new/model/hot_and_new.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplimentation implements HotAndNewService {
  @override
  Future<Either<MainFailures, HotAndNewRepo>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clintFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNewRepo>> getHotAndNewTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clintFailure());
    }
  }
}
