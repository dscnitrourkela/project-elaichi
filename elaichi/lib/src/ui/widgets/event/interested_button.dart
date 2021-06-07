import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Button to tap to show interest in an event
class InterestedButton extends StatelessWidget {
  /// Constructor for [InterestedButton]
  const InterestedButton({required this.onTap, Key? key}) : super(key: key);

  /// Callback when the button is tapped
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      fillColor: AppColors.lightScaffoldBackground,
      shape: const CircleBorder(),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '🙌',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
