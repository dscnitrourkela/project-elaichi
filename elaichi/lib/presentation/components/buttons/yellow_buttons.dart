import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';

class YellowFlatButton extends StatelessWidget {
  const YellowFlatButton({
    Key? key,
    required this.text,
    required this.onTapped,
    this.width = 338,
  }) : super(key: key);

  final String text;

  final Function onTapped;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width,
      child: GestureDetector(
        onTap: onTapped as void Function(),
        child: ColoredBox(
          color: AppColors.yellowButton,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class YellowTextButton extends StatelessWidget {
  const YellowTextButton({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed as void Function(),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            text,
            style: interTextTheme.subtitle1!.copyWith(
              letterSpacing: -0.5,
              fontSize: 15,
              color: AppColors.yellowButton,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.arrow_forward,
            color: AppColors.yellowButton,
          )
        ],
      ),
    );
  }
}
