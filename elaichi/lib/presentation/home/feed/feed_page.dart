import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/home/feed/widgets/article_list.dart';
import 'package:elaichi/presentation/home/feed/widgets/time_table_list.dart';
import 'package:elaichi/presentation/home/feed/widgets/zimbra_card.dart';
import 'package:flutter/material.dart';

///The Feed Page
class FeedPage extends StatelessWidget {
  /// Default constructor
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Feed'),
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
