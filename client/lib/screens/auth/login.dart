import 'package:GampangErp/core/widgets/sidebar_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../../configs/dimension.dart";
import '../../providers/user.dart';
import "widgets/form.dart";
import "widgets/logo.dart";
import "../dashboard.dart";

class LoginPage extends StatelessWidget{
  Widget build(BuildContext context){
    bool isLogin = Provider.of<UserProvider>(context).getIsLogin;

    if(isLogin == true){
      // Halaman baru di push ke stack
      // Navigator.pushNamed(context, '/dashboard');

      // Balik ke halaman sebelumnya 
      // Navigator.pop(context);

      // Halaman baru dan menghapus seluruh stack
      // Navigator.pushReplacementNamed(context, '/dashboard');

      return DashboardPage();
      
      // return SidebarResponsive();
      // DIGUNAKAN HANYA KETIKA MEMAKAI SIDEBAR RESPONSIVE
    }

    final theme = Theme.of(context);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = AppDimension.platformType(context) == 'Mobile';

            return Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: !isMobile ? BorderRadius.circular(16) : null, 
                  boxShadow: !isMobile ? [
                    BoxShadow(
                      blurRadius: 5, 
                      offset: Offset(0, 5), 
                    ),
                  ] : [],
                ),
                width: isMobile ? double.infinity : 500,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    SizedBox(height: 30),
                    LogoWidget(),
                    SizedBox(height: 30),
                    LoginScreen(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}