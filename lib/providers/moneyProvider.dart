import 'package:flutter/cupertino.dart';

class MoneyProvider with ChangeNotifier {
  int _money = 0;
  int get money => _money;
  void addMoney(int val) {
    _money += val;
    notifyListeners();
  }

  void setMoney(int val) {
    _money = val;
    notifyListeners();
  }
}
