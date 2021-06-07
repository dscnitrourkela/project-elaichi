import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Cirular story widget.
class StoryComponent extends StatelessWidget {
  /// Constructor for [StoryComponent].
  const StoryComponent(
      {Key? key,
      this.story,
      required this.height,
      required this.width,
      this.viewedBorderColor = Colors.white,
      this.unviewedBorderColor = Colors.blue,
      this.borderWidth = 2.0})
      : super(key: key);

  /// Data for [StoryComponent].
  final CurrentStory? story;

  /// Height of the circle container of [StoryComponent].
  final double height;

  /// Width of the circle container of [StoryComponent].
  final double width;

  /// Color of the border when the story/component has been viewed.
  final Color viewedBorderColor;

  /// Color of the border when the story/component has not been viewed.
  final Color unviewedBorderColor;

  /// Border width of [StoryComponent].
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Margins(context.display).small),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 88, 219, 1),
                Color.fromRGBO(0, 163, 255, 1)
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter)),
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: EdgeInsets.symmetric(
            horizontal: Margins(context.display).small - 4),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/Ltgq2C3/dsc.png',
        ),
      ),
    );
  }
}
