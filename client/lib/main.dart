import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import "./screens/auth/login.dart";
// import "./screens/dashboard.dart";
import './providers/user.dart';
import './providers/sidebar.dart';
import './configs/themes.dart';
import './core/utils/convertors.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  
  final storage = const FlutterSecureStorage();
  
  String? token = await storage.read(key: "token");

  final isLogin = UtilConvertors.stringToBool(token);

  // BISA PANGGIL ME DISINI

  runApp(MyApp(isLogin));
}

class MyApp extends StatelessWidget {
  final isLogin;

  MyApp(this.isLogin);

  Widget build(BuildContext context){    
    return MultiProvider(
      providers : [
        ChangeNotifierProvider(
          create: (context) => UserProvider(isLogin),
        ),
        ChangeNotifierProvider(create: (_) => SelectedMenuProvider()),
      ],
      child : MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gampang Erp',
        theme: AppThemes.lightTheme, 
        initialRoute: '/',
        routes: {
          '/' : (context) => Login(context)
        },
      )    
    );
  }
} 