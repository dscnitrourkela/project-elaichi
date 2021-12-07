import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:elaichi/home/application/home_cubit.dart';
import 'package:elaichi/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// The Landing Page of the app.
class HomePage extends StatelessWidget {
  /// Constructor for [HomePage].
  const HomePage({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationRepository>.value(
      value: _authenticationRepository,
      child: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(_authenticationRepository),
        child: SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text('HomePage'),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: () => GoRouter.of(context).go('/'),
                        error: (error) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error),
                          ),
                        ),
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Button(
                            text: 'Log Out',
                            onTapped: () => context.read<HomeCubit>().logOut(),
                          );
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
