import 'package:elaichi/app/utils/measurements.dart';
import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:elaichi/app/utils/strings.dart';
import 'package:flutter/material.dart';

///[ZimbraCard] is the idget that will be displayed if the user is not verified
///as a student of NIT Rourkela
class ZimbraCard extends StatelessWidget {
  ///Default Constructor
  const ZimbraCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.23,
        width: SizeConfig.screenWidth! * 0.92,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Strings.kNitrImage,
              fit: BoxFit.fill,
            ),
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                Strings.kShaderImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: SizeConfig.safeBlockHorizontal! * 7,
              left: SizeConfig.safeBlockHorizontal! * 7,
              child: Text(
                Strings.kRegisterNow,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal! * 6,
                    ),
              ),
            ),
            Positioned(
              top: SizeConfig.safeBlockHorizontal! * 19,
              left: SizeConfig.safeBlockHorizontal! * 7,
              child: Text(
                Strings.kZimbraCardText,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w800,
                      fontSize: SizeConfig.safeBlockHorizontal! * 3.7,
                    ),
              ),
            ),
            Positioned(
              top: SizeConfig.safeBlockHorizontal! * 30,
              left: SizeConfig.safeBlockHorizontal! * 7,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    side: Measurements.enabledBorderSide,
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {},
                child: Text(
                  Strings.kVerifyNow,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white,
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
