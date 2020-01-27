import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  String _userName='';
  bool _loggedIn=false;

  //Getters
  String get userName => _userName;
  bool get loggedIn => _loggedIn;

  //Setters
  void setUserName(String userName){
    _userName=userName;
    notifyListeners();
  }

  void setLoggedIn(bool loggedIn){
    _loggedIn = loggedIn;
    if (_loggedIn == true) setUserName('John Doe');
    notifyListeners();
  }

}