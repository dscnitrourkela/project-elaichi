import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/feed/widgets/announcements.dart';
import 'package:elaichi/presentation/home/feed/widgets/articles/article_list.dart';
import 'package:elaichi/presentation/home/feed/widgets/timetable/calender_list.dart';
import 'package:elaichi/presentation/home/feed/widgets/webmail_login/webmail_card.dart';
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal! * 4,
            ),
            child: Column(
              children: const [
                CalenderList(),
                WebMailCard(),
                ArticleList(),
                Announcements()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
