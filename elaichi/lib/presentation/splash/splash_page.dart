import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [SplashPage] is default page that loads the first required page
class SplashPage extends StatefulWidget {
  /// Default constructor for [SplashPage]
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashCubit _cubit;

  @override
  void initState() {
    _cubit = SplashCubit(userRepository: context.read<UserRepository>())
      ..getCorrectRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<SplashCubit>(
      create: (context) => _cubit,
      child: Scaffold(
        body: Column(
          children: [
            BlocConsumer<SplashCubit, SplashState>(
              builder: (context, state) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              listener: (context, state) {
                state.maybeWhen<dynamic>(
                  unauthenticated: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.signIn,
                      (route) => false,
                    );
                  },
                  googleAuthenticated: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.home,
                    (route) => false,
                  ),
                  error: (error) => ScaffoldMessenger.of(context).showSnackBar(
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
    );
  }
}
