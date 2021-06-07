import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// All events tab shown in Individual club view
class AllEvents extends StatelessWidget {
  /// Constructor for AllEvents.
  const AllEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClubViewModel>.reactive(
      builder: (BuildContext context, ClubViewModel viewModel, Widget? child) {
        return viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : viewModel.club!.fold(
                (failure) => Text(failure.toString()),
                (club) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AddButton(
                      title: 'Create New Event',
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Colors.black26,
                            ),
                          ),
                          Text('UPCOMING',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(
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
                        itemCount: club.events!.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ClubEventItemCard(
                          event: club.events![index],
                          onTap: () => viewModel.openEvent(club.events![index]),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
      viewModelBuilder: () => ClubViewModel(),
      //TODO: Get club id
      onModelReady: (ClubViewModel model) => model.initialise(42),
    );
  }
}
