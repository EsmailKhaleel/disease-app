import 'package:flutter/material.dart';

class ModelHud extends ChangeNotifier {
  bool isLoading = false;
  changeflag(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
