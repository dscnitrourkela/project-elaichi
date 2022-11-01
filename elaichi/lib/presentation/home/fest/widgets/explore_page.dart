import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/presentation/components/buttons/yellow_button.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 95,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: [
              const Divider(height: 1, thickness: 1, color: AppColors.grey7),
              const SizedBox(height: 13),
              YellowWideButton(text: 'Register Now!', onTapped: () {}),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.translucentButton,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.77,
              width: SizeConfig.screenWidth,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  HeaderWidget(
                    imageUrl:
                        'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
                    leadingWidget: Container(
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                        color: AppColors.translucentButton.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Back',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    trailingWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal! * 10,
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            Splash.instance().getUser!.photoURL.toString(),
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Icon(Icons.circle),
                        height: 34,
                        width: 32,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 308,
                    left: 16,
                    right: 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: Container(
                          height: 258,
                          color: Colors.grey.withOpacity(0.07),
                          width: 338,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Text(
                                  'HackNITR 4.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Pellentesque eu tortor pulvinar nulla massa morbi ut volutpat, non. Vitae ullamcorper fermentum, sem convallis. Etiam ipsum sollicitudin enim ullamcorper. Egestas enim, nec amet, vitae libero condimentum libero urna. Arcu rhoncus, dictum diam neque.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: AppColors.grey6.withOpacity(0.6),
                                        fontSize: 17,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const DurationDates(),
            const SizedBox(height: 62),
            Text(
              'EXCITING EVENTS',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColors.festSubTitiles),
            )
          ],
        ),
      ),
    );
  }
}
