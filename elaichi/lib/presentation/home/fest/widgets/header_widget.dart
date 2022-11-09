import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
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
          height: 544,
          fit: BoxFit.fill,
        ),
        Positioned(top: 60, left: 16, child: leadingWidget),
        Positioned(top: 60, right: 16, child: trailingWidget),
        if (title != null)
          Positioned.fill(
            bottom: 124,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 48,
                child: Text(title!, style: interTextTheme.headline1),
              ),
            ),
          ),
        if (bottomSubTitleWidget != null)
          Positioned.fill(
            bottom: 88,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(height: 28, child: bottomSubTitleWidget),
            ),
          ),
        if (buttonTitle != null)
          Positioned.fill(
            bottom: 24,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: YellowFlatButton(
                text: buttonTitle!,
                onTapped: (onTapped != null) ? onTapped! : () {},
              ),
            ),
          )
      ],
    );
  }
}
