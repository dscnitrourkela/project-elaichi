import 'package:elaichi/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              model.title,
              style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18.0),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.navigateToHome,
            child: Icon(Icons.arrow_forward),
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
