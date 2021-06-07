import 'package:elaichi/datamodels.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Contact info card for postholders of a club
class ContactCard extends StatelessWidget {
  /// Constructor for ContactCard
  const ContactCard({required this.contacts, Key? key}) : super(key: key);

  /// List of all the contacts for a particular club
  final List<ContactInfo> contacts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contacts[index].name,
                  style: TextStyles.heading2.copyWith(letterSpacing: -0.01),
                ),
                Text(
                  contacts[index].designation,
                  style:
                      TextStyles.body1.copyWith(color: AppColors.overlineText),
                )
              ],
            ),
            const Icon(
              Icons.call,
              color: AppColors.overlineText,
            ),
          ],
        );
      },
      itemCount: contacts.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 0.2,
        color: AppColors.divider,
      ),
    );
  }
}
