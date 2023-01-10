import 'package:flutter/material.dart';

class ProviderInfoPage extends ChangeNotifier {
  bool isBlocked = false;
  double pageOpacity = 1.0;
  void changeState() {
    isBlocked = !isBlocked;
    if (isBlocked) {

      toBlock();
    } else {

      unBlock();
    }
    notifyListeners();
  }

  void toBlock() {
    pageOpacity=0.1;
  }
  void unBlock() {
    pageOpacity=1.0;
  }
}
