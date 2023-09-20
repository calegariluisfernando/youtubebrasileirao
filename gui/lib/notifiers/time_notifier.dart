import 'package:flutter/foundation.dart';

import '../model/time_model.dart';

class TimeNotifier extends ChangeNotifier {
  List<Time> _timeList = [];

  List<Time> get timeList => _timeList;
  set timeList(List<Time> value) {
    _timeList = value;
    notifyListeners();
  }

}