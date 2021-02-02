import 'package:elaichi/core.dart';
import 'package:elaichi/theme.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/views.dart';
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
