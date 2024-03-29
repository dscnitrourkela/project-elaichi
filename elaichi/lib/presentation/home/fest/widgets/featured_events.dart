import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/duration_dates.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      height: 250,
      child: PhysicalModel(
        elevation: 3,
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            border: Border.all(
              color: AppColors.grey16.withOpacity(0.6),
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset(
                Strings.hackNITR,
                height: 75,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 32,
                      child: Text(
                        'Explore further into your innovation journey with HackNITR 5.0 and manifest your skills.',
                        style: interTextTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                          fontSize: 12,
                          height: 1.33,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: AppColors.grey16,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 50,
                      width: 326,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const DurationDates(
                            text: 'Coming Soon.',
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                          SizedBox(
                            height: 50,
                            width: 110,
                            child: TextButton(
                              onPressed: () {
                                launchUrlString(
                                  'https://hacknitr.com/',
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Text(
                                'Visit Website',
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
      ),
    );
  }
}
