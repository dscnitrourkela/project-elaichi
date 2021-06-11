import 'package:elaichi/datamodels.dart';
import 'package:stacked/stacked.dart';

/// Viewmodel for view event
class ViewEventViewModel extends BaseViewModel {
  Event? _event;
  bool _showDialog = false;

  /// Getter for [_event]
  Event? get event => _event;

  /// Getter for [_showDialog]
  bool get showDialog => _showDialog;

  /// Method runs when ViewEventViewModel is ready
  void init(Event? _event) {
    setBusy(true);
    this._event = _event;
    setBusy(false);
  }

  /// Toggles if dialog is visible or not
  void toggleDialog() {
    _showDialog = !_showDialog;
    notifyListeners();
  }
}
