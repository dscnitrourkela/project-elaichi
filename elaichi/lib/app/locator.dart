import 'package:get_it/get_it.dart';
import 'package:elaichi/app/locator.iconfig.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);