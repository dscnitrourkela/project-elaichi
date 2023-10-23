import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class Announcements extends StatelessWidget {
  const Announcements({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Announcements',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical! * 4,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.square_sharp,
                  color: AppColors.lightBlue,
                  size: SizeConfig.safeBlockHorizontal! * 3,
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 4,
                ),
                const Expanded(
                  child: Text(
                    'NIT Rourkela is providing free access to online courses on Coursera across skills and proficiencies.To register, login with the institute e-mail ID and avail the benefits',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
