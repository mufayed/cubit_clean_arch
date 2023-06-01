import 'package:flutter/material.dart';

import '../data/sources/network/result/network_error.dart';
import '../utils/network_status.dart';

abstract class BaseProvider extends ChangeNotifier {
  NETWORK_STATUS _status = NETWORK_STATUS.IDLE;

  NetworkError? networkError;
  NETWORK_STATUS get status => _status;

  void changeNetworkStatus(var newState) {
    _status = newState;
    notifyListeners();
  }
}
