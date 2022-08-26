import 'package:dartz/dartz.dart';
import 'package:netflixapp/core/failiurs/main_failures.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

abstract class IDownloadRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage();
}
