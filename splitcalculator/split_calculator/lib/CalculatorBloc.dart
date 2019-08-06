
import 'package:flutter/foundation.dart';

class CalculatorBloc with ChangeNotifier {

  int _people = 2;
  get people => _people;

  bool _minusEnabled = false;

  set minusEnabled(bool arg) {
    _minusEnabled = arg;
    notifyListeners();
  }

  get minusEnabled => _minusEnabled;

  bool _plusEnabled = true;
  set plusEnabled(bool arg) {
    _plusEnabled = arg;
    notifyListeners();
  }

  get plusEnabled => _plusEnabled;

  void incrementPeople() {
    _people++;
    minusEnabled = true;
    notifyListeners();
  }

  void decrementPeople() {
    _people--;
    if (_people <= 2) {
      _people = 2;
      minusEnabled = false;
    }
    notifyListeners();
  }

}