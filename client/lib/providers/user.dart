import 'package:flutter/material.dart';

import  "../models/user.dart";

class UserProvider extends ChangeNotifier{  
  bool _isLogin = false;
  ModelUser? _user;

  UserProvider(this._isLogin);

  void setUser(ModelUser user){
    _user = ModelUser(
      id : user.id,
      username : user.username,
      fullname : user.fullname,
    );

    notifyListeners();
  }

  void setIsLogin(isLogin){
    _isLogin = isLogin;
    
    notifyListeners();
  }

  ModelUser? get getUser =>  _user;

  bool get getIsLogin => _isLogin;
}