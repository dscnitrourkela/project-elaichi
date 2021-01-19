import 'package:elaichi/app/config/size_config.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:flutter/material.dart';

/// Cirular story widget.
class StoryComponent extends StatelessWidget {
  /// Constructor for [StoryComponent].
  const StoryComponent({Key key, this.story}) : super(key: key);

  /// Data for [StoryComponent].
  final CurrentStory story;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Margins(context.display).small),
      child: const CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          'assets/images/dsc.png',
        ),
        radius: 40.0,
      ),
    );
  }
}
