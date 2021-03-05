import 'package:elaichi/datamodels.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// List of all members in a club
class MemberCard extends StatelessWidget {
  /// Constructor for MemberCard
  MemberCard({@required this.members});

  /// Stores list of all the members of a club
  final List<AccessLevel> members;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              members[index].name,
              style: TextStyles.body1.copyWith(color: AppColors.cardHeader),
            ),
            members[index].level == 3 || members[index].level == 4
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.newEventBtn,
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Admin',
                          style: TextStyles.body1
                              .copyWith(color: AppColors.newEventBtn),
                        ),
                      ),
                    ),
                  )
                : Container(),
            const Spacer(),
            Text(
              members[index].relation ?? ' ',
              style:
                  TextStyles.subtitle.copyWith(color: AppColors.overlineText),
            )
          ],
        );
      },
      itemCount: members.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 0.2,
        color: AppColors.divider,
      ),
    );
  }
}
