import 'package:flutter/material.dart';

class LoadingState extends ChangeNotifier {
  LoadingState(bool isLoading) {
    _isLoading = isLoading;
  }

  late bool _isLoading;

  bool getIsLoading() {
    return _isLoading;
  }

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
