import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import "./screens/auth/login.dart";
import "./screens/dashboard.dart";
import './providers/user.dart';
import './configs/themes.dart';
import './core/utils/convertors.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  
  final prefs = await SharedPreferences.getInstance();
  
  final isLogin = UtilConvertors.stringToBool(prefs.getString('token'));

  runApp(MyApp(isLogin));
}

class MyApp extends StatelessWidget {
  final isLogin;

  MyApp(this.isLogin);

  Widget build(BuildContext context){    
    return MultiProvider(
      providers : [
        ChangeNotifierProvider(
          create: (context) => UserProvider(isLogin)
        ),
      ],
      child : MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gampang Erp',
        theme: AppThemes.lightTheme, 
        initialRoute: '/',
        routes: {
          '/' : (context) => Login(context),
          '/dashboard' : (context) => Dashboard(context)
        },
      )    
    );
  }
} 