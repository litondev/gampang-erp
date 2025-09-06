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
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            // cek lebar layar
            bool isMobile = constraints.maxWidth < 600; 

            Widget content = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Halo dunia!",
                  style: TextStyle(
                    fontSize: 24,          // ukuran font
                    fontWeight: FontWeight.bold, // tebal
                    color: Colors.blue,    // warna teks
                  )
                ),
                SizedBox(height: 40),
                LogoWidget(),
                SizedBox(height: 20),
                LoginScreen(),
              ],
            );

            return Center(
              child: Container(
                width: isMobile ? double.infinity : 400, // full kalau mobile, kotak 400px kalau web
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: content,
              ),
            );
          },
        ),
      ),
    );
  }
}