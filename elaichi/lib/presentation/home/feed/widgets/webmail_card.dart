import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/cubit/home_cubit.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/webmai_login_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[WebMailCard] is the idget that will be displayed if the user is not verified
///as a student of NIT Rourkela
class WebMailCard extends StatelessWidget {
  ///Default Constructor
  const WebMailCard({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FestBloc>();
    return SizedBox(
      height: 159,
      width: 358,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Strings.kNitrImage,
            fit: BoxFit.fill,
          ),
          Opacity(
            opacity: 1,
            child: Image.asset(
              Strings.kShaderImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              Strings.registerNow,
              style: interTextTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              Strings.zimbraCardText,
              style: interTextTheme.bodyLarge!
                  .copyWith(fontSize: 12, color: AppColors.grey17),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: SizedBox(
              width: 122,
              height: 42,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {
                  if (context.read<FestBloc>().isRegistered()) {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const WebMailLoginBottomSheet(),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    ).then(
                      (value) {
                        context
                            .read<FestBloc>()
                            .add(const FestEvent.webMailLogIn());
                        context.read<HomeCubit>().checkIfVerified();
                      },
                    );
                  } else {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const WebMailLoginBottomSheet(),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    ).then(
                      (value) => context
                          .read<FestBloc>()
                          .add(const FestEvent.webMailLogIn()),
                    );
                  }
                },
                child: Text(
                  Strings.verifyNow,
                  style: interTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
