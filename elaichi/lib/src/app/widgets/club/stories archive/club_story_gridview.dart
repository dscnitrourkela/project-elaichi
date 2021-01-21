import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/ui/views/club/club_viewmodel.dart';
import 'package:elaichi/ui/widgets/club/stories%20archive/club_story_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ClubStoryGrid extends ViewModelWidget<ClubViewModel> {
  @override
  Widget build(BuildContext context, ClubViewModel model) {
    return model.storiesArchive.fold(
      (failure) => Text(failure.toString()),
      (stories) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
                Text('2021',
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
            child: GridView.builder(
                itemCount: stories.length,
                padding: const EdgeInsets.only(top: 0, left: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
  }
}
