import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/failiurs/downloads_failures.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

abstract class IDownloadRepo {
  Future<Either<DownloadsFailures, List<Downloads>>> getDownloadsImage();
}
