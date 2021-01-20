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
      height: 66.0,
      width: 66.0,
      margin: EdgeInsets.symmetric(horizontal: Margins(context.display).small),
      padding: EdgeInsets.symmetric(horizontal: Margins(context.display).small),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 2.0),
      ),
      child: Image.asset('assets/images/dsc.png'),
    );
  }
}
