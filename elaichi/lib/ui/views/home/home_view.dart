import 'package:elaichi/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

///Contains the UI code for the home screen.
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //State management is handled using stacked.
    //ViewModelBuilder.reactive fires the builder when notifyListeners() is called in the ViewModel.
    //ViewModelBuilder.nonReactive does not fire the builder when notifyListeners() is called.
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: model.updateCounter,
            child: Icon(Icons.add),
          ),
          body: Center(
            child: Text(
              model.title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
