import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/core/api_endpoints.dart';
import 'package:netflixapp/domain/downloads/i_downloads_repo.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadRepo)
class DownloadRepository implements IDownloadRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.data['results'] as List)
            .map((e) => Downloads.fromJson(e))
            .toList();
        print(downloadList);
        return Right(downloadList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clintFailure());
    }
  }
}
