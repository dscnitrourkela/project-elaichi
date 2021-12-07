import 'package:elaichi/app/utils/strings.dart';
import 'package:elaichi/auth/application/sign_in_cubit.dart';
import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:elaichi/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

/// Sign In view stateless widget.
class SignInPage extends StatelessWidget {
  /// Constructor for [SignInPage]
  const SignInPage({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationRepository>.value(
      value: _authenticationRepository,
      child: BlocProvider<SignInCubit>(
        create: (context) => SignInCubit(_authenticationRepository),
        child: SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(Strings.kAvenueLogoFileUri),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'AVENUE',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(Strings.kPlantLogoFileUri),
                  const SizedBox(
                    height: 80,
                  ),
                  BlocConsumer<SignInCubit, SignInState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        error: (error) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error),
                          ),
                        ),
                        success: () {
                          GoRouter.of(context).go('/home');
                        },
                        orElse: () {},
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Button(
                          text: 'Sign in with Google',
                          onTapped: () =>
                              context.read<SignInCubit>().signInWithGoogle(),
                          icon: SvgPicture.asset(Strings.kGoogleLogoFileUri),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
