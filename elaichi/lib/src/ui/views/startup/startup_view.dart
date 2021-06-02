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
              ElevatedButton(
                onPressed: model.changeTheme,
                child: const Text('Change Theme'),
              ),
              ElevatedButton(
                onPressed: () => model.navigateToClubPage(),
                child: const Text('Open club page'),
              ),
              ElevatedButton(
                onPressed: () => model.startOwlMail(),
                child: const Text('start owl mail'),
              ),
              ElevatedButton(
                onPressed: () => model.getMailData(),
                child: const Text('print mail data'),
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
