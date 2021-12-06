import 'package:elaichi/app/utils/measurements.dart';
import 'package:elaichi/auth/application/cubit/sign_in_cubit.dart';
import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Sign In view stateless widget.
class SignInPage extends StatelessWidget {
  /// Constructor for [SignInPage]
  const SignInPage({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  static const String _avenueLogoFileUri = 'assets/images/avenue_logo.png';
  static const String _plantLogoFileUri = 'assets/images/plants.png';
  static const String _googleLogoFileUri = 'assets/images/google_logo.svg';

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationRepository>.value(
      value: _authenticationRepository,
      child: BlocProvider<SignInCubit>(
        create: (context) => SignInCubit(_authenticationRepository),
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (error) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                ),
              ),
              orElse: () {},
            );
          },
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: state.maybeWhen(
                  initial: () => Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Image.asset(_avenueLogoFileUri),
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
                        Image.asset(_plantLogoFileUri),
                        const SizedBox(
                          height: 80,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: Measurements.inputRadius,
                              side: Measurements.enabledBorderSide,
                            ),
                            padding: const EdgeInsets.all(16),
                          ),
                          onPressed: () =>
                              context.read<SignInCubit>().signInWithGoogle(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(_googleLogoFileUri),
                              const Padding(
                                padding: EdgeInsets.only(left: 6),
                              ),
                              Text(
                                'Sign in with Google',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: () {
                    debugPrint('navigated');
                  },
                  orElse: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
