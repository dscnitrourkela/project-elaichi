import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/feed/bloc/feed_bloc.dart';
import 'package:elaichi/presentation/home/feed/widgets/articles/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Widget containing the list of MM articles
class ArticleList extends StatelessWidget {
  /// Default Articles
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 2,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
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
          BlocBuilder<FeedBloc, FeedState>(
            bloc: context.read<FeedBloc>(),
            builder: (context, state) {
              return SizedBox(
                height: SizeConfig.safeBlockVertical! * 20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MMArticleCard(
                      index: index,
                    );
                  },
                  itemCount: state.whenOrNull(
                    success: (webMailState, data) => data.length,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
