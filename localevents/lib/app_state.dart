import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier{
  int selectedCategoryId = 0;
  
  void updateCategoryId(int selectedCategoryId){
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}