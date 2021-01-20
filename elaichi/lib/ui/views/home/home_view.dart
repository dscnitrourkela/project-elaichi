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
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'Feed', icon: Icon(Icons.dynamic_feed)),
            BottomNavigationBarItem(
                label: 'Explore', icon: Icon(Icons.explore)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Icons.account_circle)),
          ],
        ),
        body: SafeArea(
            child: IndexedStack(
          index: model.currentIndex,
          children: const [FeedView(), FeedView(), FeedView()],
        )),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
