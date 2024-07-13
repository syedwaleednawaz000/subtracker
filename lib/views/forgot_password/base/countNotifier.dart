import 'dart:async';

import 'package:flutter/foundation.dart';

class CounterNotifier extends ChangeNotifier {

  late Timer _timer;
  int _count = 59;

  int get count => _count;


  void StartTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_count > 0) {
        _count--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
    notifyListeners();
  }

}