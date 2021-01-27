import 'package:elaichi/app/colors.dart';
import 'package:elaichi/app/icons.dart';
import 'package:elaichi/app/styles.dart';
import 'package:elaichi/ui/views/feed/feed_view.dart';
import 'package:elaichi/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Contains the UI code for the home screen.
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // State management is handled using stacked.
    // ViewModelBuilder.reactive fires the builder when notifyListeners() is
    // called in the ViewModel.
    // ViewModelBuilder.nonReactive does not fire the builder when
    // notifyListeners() is called.
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          selectedLabelStyle: TextStyles.subtitle,
          selectedItemColor: AppColors.bodyText,
          unselectedItemColor: AppColors.overlineText,
          items: const [
            BottomNavigationBarItem(
              label: 'Feed',
              icon: Icon(
                AppIcons.feed,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(
                AppIcons.explore,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Campus',
              icon: Icon(
                AppIcons.campus,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: model.currentIndex,
            children: const [FeedView(), FeedView(), FeedView(), FeedView()],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
