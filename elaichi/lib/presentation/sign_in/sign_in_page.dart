import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/buttons/buttons.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Sign In view stateful widget.
class SignInPage extends StatefulWidget {
  /// Constructor for [SignInPage]
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SignInCubit _cubit;

  @override
  void initState() {
    _cubit = SignInCubit(userRepository: context.read<UserRepository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => _cubit,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.08,
                ),
                Image.asset(Strings.kAvenueLogoFileUri),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.02,
                ),
                Text(
                  'AVENUE',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.12,
                ),
                Image.asset(Strings.kPlantLogoFileUri),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.12,
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
                        Navigator.pushNamed(context, AppRouter.home);
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
    );
  }
}
