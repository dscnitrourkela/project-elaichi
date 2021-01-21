import 'package:elaichi/ui/views/club/club_viewmodel.dart';
import 'package:elaichi/ui/widgets/club/all%20events/club_event_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Displays event list in club info page
class ClubEventList extends ViewModelWidget<ClubViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return viewModel.isBusy
        ? const Center(child: CircularProgressIndicator())
        : viewModel.club.fold(
            (failure) => Text(failure.toString()),
            (club) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black26,
                        ),
                      ),
                      Text('UPCOMING',
                          style: Theme.of(context).textTheme.overline.copyWith(
                                color: Colors.grey,
                              )),
                      const Expanded(
                        child: Divider(
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      itemCount: club.events.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ClubEventItemCard(club.events[index])),
                ),
              ],
            ),
          );
  }
}
