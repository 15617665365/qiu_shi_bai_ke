import 'package:flutter/material.dart';

class CurrentVideoProvide with ChangeNotifier{
  int currentVideo = 0;
  bool isPlayer = false;
  changeIndex(int newIndex, bool palyer){
    currentVideo = newIndex;
    isPlayer = palyer;
    notifyListeners();
  }

}