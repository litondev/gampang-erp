import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../../core/widgets/sidebar.dart";
import '../providers/user.dart';
import './auth/login.dart';

class Dashboard extends StatelessWidget{
  bool? isLogin;

  Dashboard(BuildContext context){
    this.isLogin = Provider.of<UserProvider>(context).getIsLogin();
  } 

  Widget build(BuildContext context){
    if(isLogin != true){
      return Login(context);
    }

    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title : Text("Dashboard"),      
        ),
        drawer: Sidebar(parentContext: context),
      )
    );
  }
}