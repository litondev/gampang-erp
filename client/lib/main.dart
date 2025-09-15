import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/rendering.dart';

import './providers/user.dart';
import './providers/sidebar.dart';
import './providers/theme.dart';
import './configs/themes.dart';
import './configs/storage.dart';
import './configs/platform.dart';
import './core/utils/convertors.dart';
import "./screens/auth/login.dart";

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  debugPaintSizeEnabled = false;

  String? token = "";
  String? themeMode = "";
  
  if (AppPlatform.getPlatform() == 'Web') {
    await initLocalStorage();
    
    token = localStorage.getItem("token");

    themeMode = localStorage.getItem("theme_mode");
  } else {
    token = await AppStorage.Secure.read(key: "token");

    themeMode = await AppStorage.Secure.read(key: "theme_mode");
  }
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        isLogin: UtilConvertors.stringToBool(token),
        themeMode : themeMode
      ),
    )
  );
}

class SplashScreen extends StatefulWidget {
  final bool isLogin;
  final String? themeMode;

  const SplashScreen({required this.isLogin,required this.themeMode});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // DISINI BISA MENGASKES API SEBELUM SELURUH APP DIJALANKAN

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MyApp(widget.isLogin,widget.themeMode), 
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
  final bool isLogin;
  final String? themeMode;

  MyApp(this.isLogin,this.themeMode);

  @override
  Widget build(BuildContext context) {    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(isLogin)),
        ChangeNotifierProvider(create: (_) => SidebarProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider(themeMode)),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context,listen: true);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Gampang Erp',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => Login(context),
            },
          );    
        }
      )
    );
  }
}
