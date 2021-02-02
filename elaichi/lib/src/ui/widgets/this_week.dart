import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/src/app/icons.dart';
import 'package:elaichi/src/generated/locale_keys.g.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Widget for current week's Monday Morning articles.
class ThisWeek extends StatelessWidget {
  /// Constructor for ThisWeek.
  const ThisWeek({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 410 / 260,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 29.0),
                  child: Icon(
                    AppIcons.mmIcon,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(LocaleKeys.thisWeekTitle.tr(),
                        style: TextStyles.heading1),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => AspectRatio(
                aspectRatio: 16 / 9.68,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                            imageUrl: 'https://i.ibb.co/R9NBqPr/sanitizer.jpg',
                            fit: BoxFit.cover),
                        Container(
                          child: Align(
                            alignment: const Alignment(0.0, 0.7),
                            child: Text(
                              '''
A Noble Breakthrough: NIT Rourkela produces alcohol-based sanitizers''',
                              textAlign: TextAlign.center,
                              style: TextStyles.heading2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(1),
                                Colors.black.withOpacity(0)
                              ],
                              begin: FractionalOffset.bottomLeft,
                              end: FractionalOffset.topRight,
                            ),
                          ),
                        ),
                      ],
                    ),
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
