import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Card for displaying different items on club info tab in club details
class InfoCard extends StatelessWidget {
  /// Constructor for InfoCard
  const InfoCard({required this.title, required this.child, Key? key})
      : super(key: key);

  /// The heading of the card
  final String title;

  /// Child widgets of the info card
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
      child: Card(
        elevation: 0.0,
        semanticContainer: true,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.heading2.copyWith(letterSpacing: -0.01),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Divider(
                  thickness: 0.2,
                  color: AppColors.divider,
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
