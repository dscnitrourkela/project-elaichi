import 'package:elaichi/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:elaichi/app/extensions.dart';

/// Contains the UI code for the home screen.
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // State management is handled using stacked.
    // ViewModelBuilder.reactive fires the builder when notifyListeners() is called in the ViewModel.
    // ViewModelBuilder.nonReactive does not fire the builder when notifyListeners() is called.
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: model.updateCounter,
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text("Your Feed"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  model.title,
                  style: context.textTheme.headline5,
                ),
              ),
              Text(
                model.counter.toString(),
                style: context.textTheme.headline6,
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
