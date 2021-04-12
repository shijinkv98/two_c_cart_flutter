import 'package:flutter/cupertino.dart';

class DocsAddedNotifier extends ChangeNotifier {
  bool _isAdded = false;
  bool get isAdded => _isAdded;
  set isLoading(bool duty) {
    _isAdded = duty;
    notifyListeners();
  }

  void reset() {
    _isAdded = false;
  }
  void docAdded() {
    _isAdded=true;
    notifyListeners();
  }
}