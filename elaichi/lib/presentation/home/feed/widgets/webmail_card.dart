import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/webmai_login_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[WebMailCard] is the idget that will be displayed if the user is not verified
///as a student of NIT Rourkela
class WebMailCard extends StatelessWidget {
  ///Default Constructor
  const WebMailCard({Key? key}) : super(key: key);
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
              style: interTextTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              Strings.zimbraCardText,
              style: interTextTheme.bodyText1!
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
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const WebMailLoginBottomSheet(),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                  ).then((value) => bloc.add(const FestEvent.webMailLogIn()));
                },
                child: Text(
                  Strings.verifyNow,
                  style: interTextTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
