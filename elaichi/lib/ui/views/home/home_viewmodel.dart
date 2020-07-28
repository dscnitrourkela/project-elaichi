import 'package:stacked/stacked.dart';

///ViewModel class for [HomeView]
class HomeViewModel extends BaseViewModel {
  String _title = "Welcome to NITR Central";

  ///Returns [_title] followed by [_counter].
  String get title => "$_title $_counter";

  //Counter example using stacked.
  int _counter = 0;

  ///Returns [_counter] value.
  int get counter => _counter;

  ///Called when '+' button is tapped on [HomeView]
  void updateCounter() {
    _counter++;
    notifyListeners();
  }
}
