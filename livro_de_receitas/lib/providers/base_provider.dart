import 'package:flutter/material.dart';

abstract class BaseProvider extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

  String _error = '';
  String get error => _error;

  setRunning(value) {
    _running = value;
    notifyListeners();
  }

  setError(error) {
    _error = error;
  }
}