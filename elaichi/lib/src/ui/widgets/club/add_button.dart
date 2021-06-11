import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Button to add new event for a club. Only shown to admins of a club
class AddButton extends StatelessWidget {
  // ignore: public_member_api_docs
  const AddButton({required this.title, required this.onPressed, Key? key})
      : super(key: key);

  ///Title of the button
  final String title;

  /// Callback for onPressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minimumSize: const Size.fromWidth(double.maxFinite),
            backgroundColor: AppColors.newEventBtn),
        onPressed: onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  title,
                  style: TextStyles.heading1.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
