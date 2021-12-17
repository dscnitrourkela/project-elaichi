import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

///Widget containing the list of MM articles
class ArticleList extends StatelessWidget {
  /// Default Articles
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal! * 2,
        vertical: SizeConfig.safeBlockVertical! * 2,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal!,
              vertical: SizeConfig.safeBlockVertical! * 0.8,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/mm.png',
                  height: SizeConfig.safeBlockVertical! * 5,
                  fit: BoxFit.cover,
                ),
                Text(
                  '  Stories this week',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
