import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:elaichi/app/utils/strings.dart';
import 'package:elaichi/feed/presentation/widgets/article_item.dart';
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
                  Strings.kMmLogo,
                  height: SizeConfig.safeBlockVertical! * 5,
                  fit: BoxFit.cover,
                ),
                Text(
                  Strings.kStoriesthisWeek,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return MMArticleCard(
                  title: Strings.kMmCardTitle,
                  imageUrl: Strings.kMmCardImageUri,
                  onTapped: () {},
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
