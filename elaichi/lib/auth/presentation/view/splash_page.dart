import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:elaichi/auth/application/user_cubit/user_data_cubit.dart';
import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// [SplashPage] is default page that loads the first required page
class SplashPage extends StatelessWidget {
  /// Default constructor for [SplashPage]
  const SplashPage({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RepositoryProvider<AuthenticationRepository>.value(
      value: _authenticationRepository,
      child: BlocProvider<UserDataCubit>(
        create: (context) => UserDataCubit(_authenticationRepository),
        child: Scaffold(
          body: Column(
            children: [
              BlocConsumer<UserDataCubit, UserDataState>(
                builder: (context, state) {
                  return Container();
                },
                listener: (context, state) {
                  state.maybeWhen(
                    unauthenticated: () {
                      GoRouter.of(context).goNamed('/signin');
                    },
                    googleAuthenticated: () =>
                        GoRouter.of(context).goNamed('/home'),
                    error: (error) =>
                        ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error),
                      ),
                    ),
                    orElse: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
