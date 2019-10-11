import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = "Welcome to NITR Central";

  String get title => "$_title $_counter";

  //Counter example using stacked.
  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

}
