import 'package:elaichi/theme.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Show club info for a particular club
class ClubInfo extends StatelessWidget {
  /// Constructor for ClubInfo.
  const ClubInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClubViewModel>.reactive(
      builder: (BuildContext context, ClubViewModel viewModel, Widget? child) {
        return viewModel.isBusy
            ? const CircularProgressIndicator()
            : viewModel.club!.fold(
                (failure) => Text(failure.toString()),
                (club) => ListView(
                  children: [
                    InfoCard(
                      title: 'Description',
                      child: Text(
                        club.description!,
                        style: TextStyles.body1,
                      ),
                    ),
                    InfoCard(
                      title: 'Contact Details',
                      child: ContactCard(
                        contacts: club.contactInfo,
                      ),
                    ),
                    InfoCard(
                      title: 'Members',
                      child: MemberCard(
                        members: club.members,
                      ),
                    ),
                  ],
                ),
              );
      },
      viewModelBuilder: () => ClubViewModel(),
      onModelReady: (ClubViewModel model) => model.initialise(24),
    );
  }
}
