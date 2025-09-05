// PERLUD DIUBAH

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../providers/user.dart';

class Sidebar extends StatelessWidget{
  final parentContext;

  Sidebar({
    @required this.parentContext
  });

  @override 
  Widget build(BuildContext context){
    return Drawer(
      child : Column(
        children: <Widget>[
          AppBar(
            title: Text("Menu"),
            automaticallyImplyLeading :  false
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.devices),
            title: Text("Dashabord"),
            onTap: (){
              Navigator.of(parentContext).pushReplacementNamed("/dashboard");
            }
          ),

         Divider(),

          Divider(),

          ListTile(
            leading: Icon(Icons.lens),
            title : Text("Profil"),
            onTap: (){
              Navigator.of(parentContext).pushReplacementNamed("/profil");
            },
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.lens),
            title : Text("Logout"),
            onTap: () => onLogout(parentContext)
          )
        ],
      )
    );
  }

  void onLogout(context) async{
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');

    Provider.of<UserProvider>(context,listen : false).setIsLogin(false);
    
    Navigator.of(context).pushReplacementNamed("/");         
  }
}