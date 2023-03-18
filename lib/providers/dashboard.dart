import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  int pageIndex = 0;
  void gotoPageIndex(int index) {
    pageIndex = index;
    print('sharan go ' + index.toString());
    notifyListeners();
  }
}
