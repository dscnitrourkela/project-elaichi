import 'package:elaichi/feed/presentation/widgets/article_list.dart';
import 'package:elaichi/feed/presentation/widgets/time_table_list.dart';
import 'package:elaichi/feed/presentation/widgets/zimbra_card.dart';
import 'package:elaichi/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

///The Feed Page
class FeedPage extends StatelessWidget {
  /// Default constructor
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Feed', context: context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [TimeTableList(), ZimbraCard(), ArticleList()],
          ),
        ),
      ),
    );
  }
}
