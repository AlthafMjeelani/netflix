import 'package:dio/dio.dart';
import 'package:netflixapp/core/failiurs/downloads_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/core/api_endpoints.dart';
import 'package:netflixapp/domain/downloads/i_downloads_repo.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

class DownloadRepository implements IDownloadRepo {
  @override
  Future<Either<DownloadsFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadList = [];
        for (var raw in response.data) {
          downloadList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        return Right(downloadList);
      } else {
        return const Left(DownloadsFailures.serverFailure());
      }
    } catch (e) {
      return const Left(DownloadsFailures.clintFailure());
    }
  }
}
