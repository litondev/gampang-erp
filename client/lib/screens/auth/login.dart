import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user.dart';
import "../dashboard.dart";
import "widgets/form.dart";
import "widgets/logo.dart";

class Login extends StatelessWidget{
  bool? isLogin;

  Login(BuildContext context){
    this.isLogin = Provider.of<UserProvider>(context).getIsLogin();
  } 

  Widget build(BuildContext context){
    if(isLogin == true){
      return Dashboard(context);
    }

    return MaterialApp(
      home : Scaffold(      
        body : Padding(
          padding : EdgeInsets.only(
            left : 20,
            right : 20
          ),
          child : Column(    
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),            
              LoginScreen(),        
            ]
          )
        )
      )
    );
  }
}