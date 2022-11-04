import 'package:flutter/cupertino.dart';
import 'package:phanerozoic_assignment/models/userModel.dart';

class UserProvider with ChangeNotifier {
  User _user = User(phoneNumber: "0000000000");
  String get phone => _user.phoneNumber;
  int get fees => _user.fees;
  List<List<String>> get history => _user.history;
  void setPhone(String phNo) {
    _user.phoneNumber = phNo;
    notifyListeners();
  }

  void setFees(int fee) {
    _user.fees = fee;
    notifyListeners();
  }

  void addHistory(List<String> receipt) {
    _user.history.add(receipt);
    notifyListeners();
  }

  void setHistory(List<List<String>> hist) {
    _user.history = hist;
    notifyListeners();
  }
}
