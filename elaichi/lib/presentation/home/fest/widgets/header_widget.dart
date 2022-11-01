import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/presentation/components/buttons/yellow_button.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.leadingWidget,
    required this.trailingWidget,
    required this.imageUrl,
    this.title,
    this.bottomSubTitleWidget,
    this.buttonTitle,
    this.onTapped,
  }) : super(key: key);

  final Widget leadingWidget;
  final Widget trailingWidget;
  final String? title;
  final String imageUrl;
  final Widget? bottomSubTitleWidget;
  final String? buttonTitle;
  final Function? onTapped;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 430,
          fit: BoxFit.fill,
        ),
        Positioned(top: 64, left: 16, child: leadingWidget),
        Positioned(
          top: 64,
          right: 16,
          child: trailingWidget,
        ),
        if (title != null)
          Positioned.fill(
            bottom: 124,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title!,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        if (bottomSubTitleWidget != null)
          Positioned.fill(
            bottom: 88,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: bottomSubTitleWidget,
            ),
          ),
        if (buttonTitle != null)
          Positioned.fill(
            bottom: 24,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: YellowWideButton(
                text: buttonTitle!,
                onTapped: (onTapped != null) ? onTapped! : () {},
              ),
            ),
          )
      ],
    );
  }
}
