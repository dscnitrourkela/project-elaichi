import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/feed/bloc/feed_bloc.dart';
import 'package:elaichi/presentation/home/feed/widgets/articles/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Widget containing the list of MM articles
class ArticleList extends StatelessWidget {
  /// Default Articles
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: context.read<FeedBloc>(),
      builder: (context, state) {
        return state.maybeWhen(
          orElse: Container.new,
          initial: (webMailState, articles) => (articles.isNotEmpty)
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              Strings.kMmLogo,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              Strings.kStoriesthisWeek,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MMArticleCard(
                              index: index,
                            );
                          },
                          itemCount: articles.length,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
