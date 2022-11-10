import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
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
    _cubit = context.read<SplashCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final toastUtil = ToastUtil.getInstance();
    SizeConfig().init(context);
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          state.whenOrNull<dynamic>(
            unauthenticated: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.signIn,
              (route) => false,
            ),
            googleAuthenticated: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.home,
              (route) => false,
            ),
            error: (error) =>
                toastUtil.showToast(mode: ToastMode.Error, title: error),
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: state.maybeWhen(
              orElse: () => Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.08,
                    ),
                    Image.asset(Strings.avenueLogoFileUri),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    Text(
                      'AVENUE',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            letterSpacing: 2,
                            fontSize: 20,
                            color: AppColors.avenueTitle.withOpacity(0.6),
                          ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.12,
                    ),
                    Image.asset(Strings.kPlantLogoFileUri),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.12,
                    ),
                  ],
                ),
              ),
              error: (error) => const Center(
                child: Text(
                  'Unable to establish connection, please lauch the app again',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
