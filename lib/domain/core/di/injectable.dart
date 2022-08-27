import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/core/di/injectable.config.dart';

final getit = GetIt.instance;

@InjectableInit()
Future<void> configerInjection() async {
  $initGetIt(getit, environment: Environment.prod);
}
