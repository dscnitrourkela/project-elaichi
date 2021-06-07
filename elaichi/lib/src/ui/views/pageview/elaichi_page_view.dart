import 'package:elaichi/datamodels.dart';
import 'package:elaichi/core.dart';
import 'package:flutter/material.dart';

/// PageView used for displaying stories and events.
class ElaichiPageView extends StatefulWidget {
  /// Constructor for [ElaichiPageView].
  const ElaichiPageView({
    Key? key,
    required this.initialPage,
    required this.stories,
    this.topPadding,
  }) : super(key: key);

  /// Initial page index to open the page view in.
  final int initialPage;

  /// List of stories for the page view.
  final List<CurrentStory> stories;

  /// Top padding to apply to the page view.
  final double? topPadding;

  @override
  _ElaichiPageViewState createState() => _ElaichiPageViewState();
}

class _ElaichiPageViewState extends State<ElaichiPageView> {
  // ignore: unused_field
  PageController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'PageView',
          style: context.textTheme.headline6,
        ),
      ),
    );
  }
}
