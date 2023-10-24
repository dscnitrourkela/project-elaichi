import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/core/utils/urlLauncher.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/duration_dates.dart';
import 'package:flutter/material.dart';

class FeaturedEvents extends StatelessWidget {
  const FeaturedEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.featuredEvents,
          style: interTextTheme.displayMedium!.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 20),
        const FeaturedEventCard(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class FeaturedEventCard extends StatelessWidget {
  const FeaturedEventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 448,
      child: PhysicalModel(
        elevation: 3,
        color: Colors.white,
        shadowColor: Colors.grey,
        child: Column(
          children: [
            Image.asset(
              Strings.hackNITR,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 20,
                    child: Text(
                      'Featured Event',
                      style: interTextTheme.titleMedium!.copyWith(
                        letterSpacing: -0.41,
                        color: AppColors.grey16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 28,
                    child: Text(
                      'HackNITR 4.0',
                      style: interTextTheme.bodyLarge!.copyWith(
                        fontSize: 22,
                        height: 1.27,
                        letterSpacing: 0.35,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: Text(
                      'Explore further into your innovation journey with HackNITR 4.0 and manifest your skills.',
                      style: interTextTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey11,
                        fontSize: 12,
                        height: 1.33,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    width: 326,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DurationDates(
                          text: 'Jan 06 - Jan 08 2023',
                          color: AppColors.grey16,
                          fontSize: 14,
                        ),
                        SizedBox(
                          height: 50,
                          width: 104,
                          child: TextButton(
                            onPressed: () {
                              launchURL('https://www.hacknitr.com/');
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: Text(
                              'Register',
                              style: interTextTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 1.28,
                                color: Colors.white,
                                letterSpacing: -0.41,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
