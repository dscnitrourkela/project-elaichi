import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 98,
      decoration: BoxDecoration(
        color: AppColors.translucentButton.withOpacity(0.4),
        borderRadius: BorderRadius.circular(18),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 5),
            Text(
              'Back',
              style: interTextTheme.titleSmall!.copyWith(
                color: Colors.white,
                fontSize: 15,
                height: 1.33,
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
