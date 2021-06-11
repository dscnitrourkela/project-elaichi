import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Current and past stories shown in clubs page
class StoriesArchive extends StatelessWidget {
  /// Constructor for StoriesArchive.
  const StoriesArchive({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClubViewModel>.reactive(
      builder: (BuildContext context, ClubViewModel viewModel, Widget? child) {
        return viewModel.isBusy
            ? const CircularProgressIndicator()
            : viewModel.storiesArchive!.fold(
                (failure) => Text(failure.toString()),
                (stories) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddButton(
                      title: 'Add New Story',
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
                          Text('2021',
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
                      child: GridView.builder(
                          itemCount: stories.length,
                          padding: const EdgeInsets.only(top: 0, left: 8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 122 / 173,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (BuildContext context, int index) =>
                              ClubStoryGridItem(
                                story: stories[index],
                              )),
                    )
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
