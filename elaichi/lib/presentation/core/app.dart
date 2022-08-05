import 'package:elaichi/data/local/local_storage_service.dart';
import 'package:elaichi/data/remote/api_service.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/router/navigation_service.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The main app.
class ElaichiApp extends StatelessWidget {
  /// Constructor of [ElaichiApp].
  const ElaichiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.splash,
      theme: AppTheme.light,
      title: 'Avenue For NITR',
      debugShowCheckedModeBanner: false,
    );
  }

  static Future<Widget> run() async {
    final localStorageService = await LocalStorageService.init();
    final apiService = APIService();

    return MultiRepositoryProvider(
      providers: <RepositoryProvider<dynamic>>[
        RepositoryProvider<UserRepository>(
          create: (BuildContext context) => UserRepository(
            localStorageService: localStorageService,
            apiService: apiService,
          ),
        )
      ],
      child: const ElaichiApp(),
    );
  }
}
