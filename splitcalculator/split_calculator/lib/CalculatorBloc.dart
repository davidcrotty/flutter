
import 'package:flutter/foundation.dart';

class CalculatorBloc with ChangeNotifier {

  int _people = 0;
  get people => _people;

  void incrementPeople() {
    _people++;
    notifyListeners();
  }

}