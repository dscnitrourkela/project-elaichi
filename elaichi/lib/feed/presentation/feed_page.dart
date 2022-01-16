import 'package:elaichi/feed/application/feed_cubit.dart';
import 'package:elaichi/feed/presentation/widgets/article_list.dart';
import 'package:elaichi/feed/presentation/widgets/time_table_list.dart';
import 'package:elaichi/feed/presentation/widgets/zimbra_card.dart';
import 'package:elaichi/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///The Feed Page
class FeedPage extends StatefulWidget {
  /// Default constructor
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Feed', context: context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BlocConsumer<FeedCubit, FeedState>(
                listener: (context, state) {
                  debugPrint('from listner $state');
                  state.maybeWhen(
                    orElse: () {},
                    initial: () {
                      setState(() {
                        context.read<FeedCubit>().getMailId();
                      });
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      context.read<FeedCubit>().getMailId();
                      debugPrint('from builder $state');
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    error: (error) => Text(error),
                    mailunchecked: () => BlocProvider.value(
                      value: BlocProvider.of<FeedCubit>(context),
                      child: const ZimbraCard(),
                    ),
                    success: () => const TimeTableList(),
                  );
                },
              ),
              const ArticleList()
            ],
          ),
        ),
      ),
    );
  }
}
