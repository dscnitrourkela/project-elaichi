import 'package:elaichi/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Global getIt instance
final GetIt getIt = GetIt.instance;

/// A functions that configures [Injectable]
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
