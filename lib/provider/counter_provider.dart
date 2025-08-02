import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{

  int _count = 0;
  int get count => _count;

  void incrementCounter(){
    _count += 1;
    notifyListeners();
  }
  void decrementCounter() {
    _count  -= 1;
    notifyListeners();
  }

}