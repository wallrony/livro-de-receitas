import 'package:flutter/material.dart';

abstract class BaseProvider extends ChangeNotifier {
  bool _running;
  bool get running => _running;

  setRunning(value) {
    _running = value;
    notifyListeners();
  }
}