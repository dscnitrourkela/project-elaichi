import 'package:elaichi/core.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Story bar displayed in FeedView.
class StoryBar extends ViewModelWidget<FeedViewModel> {
  /// Constructor for [StoryBar].
  const StoryBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    return AspectRatio(
      aspectRatio: 410 / 120,
      child: Container(
        color: context.theme.colorScheme.surface,
        child: viewModel.currentStories.fold(
          (failure) => Text(failure.toString()),
          (currentStories) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentStories.length,
            itemBuilder: (BuildContext context, int index) {
              return StoryComponent(
                story: currentStories[index],
                height: 66.0,
                width: 66.0,
                borderWidth: 4.0,
              );
            },
          ),
        ),
      ),
    );
  }
}
