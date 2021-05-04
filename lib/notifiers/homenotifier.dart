import 'package:flutter/material.dart';

class HomeUpdateNotifier extends ChangeNotifier {
  bool _isProgressShown=false;
  bool get isProgressShown => _isProgressShown;
  set isProgressShown(bool duty)
  {
    _isProgressShown=duty;
    notifyListeners();
  }

  void reset() {
    _isProgressShown=false;
  }
}