import 'package:flutter/material.dart';

import  "../models/user.dart";

class UserProvider extends ChangeNotifier{  
  ModelUser? _user;
  bool _isLogin = false;

  UserProvider(this._isLogin);

  setUser(ModelUser user){
    _user = ModelUser(
      id : user.id,
      username : user.username,
      fullname : user.fullname,
    );

    notifyListeners();
  }

  setIsLogin(isLogin){
    _isLogin = isLogin;
    notifyListeners();
  }

  ModelUser? getUser(){
    return _user;
  }

  bool getIsLogin(){
    return _isLogin;
  }
}