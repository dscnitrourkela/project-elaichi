import 'package:elaichi/presentation/components/bottom_sheet/bottom_sheet.dart';
import 'package:elaichi/presentation/components/buttons/buttons.dart';
import 'package:elaichi/presentation/components/inputs/text_field_input.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';

class WebMailLoginBottomSheet extends StatelessWidget {
  const WebMailLoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Webmail Login',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            TextFieldInput(title: 'Roll Number', hintText: 'Roll Number'),
            SizedBox(
              height: 25,
            ),
            TextFieldInput(title: 'Password', hintText: 'Password'),
          ],
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Button(
          text: 'Login',
          color: AppColors.lightBlue,
          onTapped: () {},
        ),
      ),
    );
  }
}
