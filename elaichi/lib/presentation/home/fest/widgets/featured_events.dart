import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:flutter/material.dart';

class FeaturedEvents extends StatelessWidget {
  const FeaturedEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.featuredEvents,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 20),
        const FeaturedEventCard()
      ],
    );
  }
}

class FeaturedEventCard extends StatelessWidget {
  const FeaturedEventCard({
    Key? key,
    // required this.text,
    // required this.description,
    // required this.duration,
  }) : super(key: key);

  // final String text;
  // final String description;
  // final String duration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 405,
      child: PhysicalModel(
        elevation: 3,
        color: Colors.white,
        shadowColor: Colors.grey,
        child: Column(
          children: [
            Image.network(
              Strings.placeholderImage,
              height: 250,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'INNOVISION 2K22',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Join us lorem ipusum dssdfesfwefesfsefesffefeffefefefefesvse',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 12),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: AppColors.grey2,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Jan 03 - Jan 07 2023',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(width: 30),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
                        ),
                        child: Text(
                          'Register',
                          style: Theme.of(context).textTheme.button!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: Colors.white,
                              ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
