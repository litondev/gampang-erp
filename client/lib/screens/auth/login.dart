import 'package:GampangErp/core/widgets/sidebar_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../../configs/dimension.dart";
import "../../configs/text_styles.dart";
import '../../providers/user.dart';
import "widgets/form.dart";
import "widgets/logo.dart";

class Login extends StatelessWidget{
  bool? isLogin;

  Login(BuildContext context){
    this.isLogin = Provider.of<UserProvider>(context).getIsLogin;
  } 

  Widget build(BuildContext context){
    if(isLogin == true){
      return SidebarResponsive();
    }

   return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = AppDimension.platformType(context) == 'Mobile';

            return Center(
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.white, 
                  borderRadius: !isMobile ? BorderRadius.circular(16) : null, 
                  boxShadow: !isMobile ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
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