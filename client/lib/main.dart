import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/rendering.dart';

import './providers/user.dart';
import './providers/sidebar.dart';
import './configs/themes.dart';
import './configs/storage.dart';
import './configs/platform.dart';
import './core/utils/convertors.dart';
import "./screens/auth/login.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  debugPaintSizeEnabled = false;

  String? token = "";
  
  if (AppPlatform.getPlatform() == 'Web') {
    await initLocalStorage();
    token = localStorage.getItem("token");
  } else {
    token = await AppStorage.Secure.read(key: "token");
  }

  final isLogin = UtilConvertors.stringToBool(token);
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(
      isLogin: isLogin
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  final bool isLogin;
  const SplashScreen({required this.isLogin});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // DISINI BISA MENGASKES API SEBELUM SELURUH APAP DIJALANKAN

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MyApp(widget.isLogin), 
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final isLogin;

  MyApp(this.isLogin);

  @override
  Widget build(BuildContext context) {    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(isLogin)),
        ChangeNotifierProvider(create: (_) => SidebarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gampang Erp',
        theme: AppThemes.lightTheme, 
        initialRoute: '/',
        routes: {
          '/': (context) => Login(context),
        },
      ),    
    );
  }
}
