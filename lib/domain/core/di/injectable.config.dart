// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/download/downloads_bloc.dart' as _i10;
import '../../../application/fastLaugh/fast_laughs_bloc.dart' as _i11;
import '../../../application/home/home_bloc.dart' as _i12;
import '../../../application/hotnadnew/hot_and_new_bloc.dart' as _i13;
import '../../../application/search/search_bloc.dart' as _i9;
import '../../../infrastructure/downloads/downloads_repository.dart' as _i6;
import '../../../infrastructure/hot_and_new/hot_and_new_repo.dart' as _i4;
import '../../../infrastructure/search/search_repository.dart' as _i8;
import '../../downloads/i_downloads_repo.dart' as _i5;
import '../../hot_and_new/hot_and_new_service.dart' as _i3;
import '../../search/i_serch_repo.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplimentation());
  gh.lazySingleton<_i5.IDownloadRepo>(() => _i6.DownloadRepository());
  gh.lazySingleton<_i7.ISearchFazard>(() => _i8.SearchRepository());
  gh.factory<_i9.SearchBloc>(
      () => _i9.SearchBloc(get<_i5.IDownloadRepo>(), get<_i7.ISearchFazard>()));
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i5.IDownloadRepo>()));
  gh.factory<_i11.FastLaughsBloc>(
      () => _i11.FastLaughsBloc(get<_i5.IDownloadRepo>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i13.HotAndNewBloc>(
      () => _i13.HotAndNewBloc(get<_i3.HotAndNewService>()));
  return get;
}
