import 'package:elaichi/presentation/core/utils/measurements.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 159,
        width: 368,
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
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal! * 6,
                    ),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                Strings.zimbraCardText,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
              ),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    side: Measurements.enabledBorderSide,
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
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
