import 'package:elaichi/viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

///Contains the UI code for Startup screen.
class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final log = getLogger("StartupView");
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  model.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 18.0),
                ),
              ),
              RaisedButton(
                onPressed: model.changeTheme,
                child: const Text('Change Theme'),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.navigateToHome(),
            child: const Icon(Icons.arrow_forward),
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
