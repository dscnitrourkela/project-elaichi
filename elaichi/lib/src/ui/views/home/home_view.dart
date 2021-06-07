import 'package:elaichi/core.dart';
import 'package:elaichi/theme.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/views.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

///
class BottomAppBarItem extends ViewModelWidget<HomeViewModel> {
  ///
  const BottomAppBarItem({Key? key, this.icon, this.index}) : super(key: key);

  /// IconData to show in the BottomAppBarItem.
  final IconData? icon;

  /// Index to set in the viewmodel.
  final int? index;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return IconButton(
        icon: Icon(icon,
            color: viewModel.isIndexSelected(index!)
                ? AppColors.selectedIconColor
                : AppColors.unselectedIconColor),
        onPressed: () => viewModel.setIndex(index!));
  }
}

/// Contains the UI code for the home screen.
class HomeView extends StatelessWidget {
  /// Constructor for HomeView.
  const HomeView({Key? key}) : super(key: key);

  final _bottomAppBarItems = const <Widget>[
    BottomAppBarItem(
      icon: AppIcons.feed,
      index: 0,
    ),
    BottomAppBarItem(
      icon: AppIcons.explore,
      index: 1,
    ),
    BottomAppBarItem(
      icon: AppIcons.campus,
      index: 2,
    ),
  ];

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
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ..._bottomAppBarItems.toList(),
                const CircleAvatar(foregroundColor: Colors.black)
              ],
            ),
          ),
        ),
        body: SafeArea(
          child:
              IndexedStack(index: model.currentIndex, children: const <Widget>[
            FeedView(),
            FeedView(),
            OwlMailView(),
            FeedView(),
          ]),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
