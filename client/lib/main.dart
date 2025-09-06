import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:localstorage/localstorage.dart';

import './providers/user.dart';
import './providers/sidebar.dart';
import './configs/themes.dart';
import './configs/storage.dart';
import './configs/platform.dart';
import './core/utils/convertors.dart';
import "./screens/auth/login.dart";

void main() async {
  await dotenv.load(fileName: ".env");

  String? token = "";
  
  if(AppPlatform.getPlatform() == 'Web'){
    await initLocalStorage();

    token = localStorage.getItem("token");
  }else{
    token = await AppStorage.Secure.read(key: "token");
  }

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
        ChangeNotifierProvider(create: (_) => UserProvider(isLogin)),
        ChangeNotifierProvider(create: (_) => SidebarProvider()),
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