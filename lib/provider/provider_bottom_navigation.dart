import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  late String title;
  void changeIndex(int index) {
    currentIndex = index;
     switch(index) { 
       case 0: { title = 'Kontakte'; } 
       break; 
       case 1: { title = 'Settings'; } 
       break;
      } 
    notifyListeners();
  }
}