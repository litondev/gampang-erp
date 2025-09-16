import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../../../providers/user.dart';
import "../../../core/widgets/spinner.dart";
import  "../../../models/user.dart";
import "../../../services/me.dart";
import '../../../configs/storage.dart';
import '../../../configs/platform.dart';
import '../../../core/utils/formats.dart';
import '../../../core/utils/validators.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);
  @override 
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
  final formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  bool isLoadingForm = false;
  late UserProvider userProvider;

  // JANGAN GUNAKAN INI STATE
  // @override
  // void initState() {
    // super.initState();
    // userProvider = Provider.of<UserProvider>(context,listen: false);
  // }

  // GUNAKAN INI
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProvider = Provider.of<UserProvider>(context,listen: false);
  }

  @override 
  void dispose(){    
    super.dispose();
  }

  @override 
  Widget build(BuildContext context){
    return Container(
      child : Form(
        key: formKey,
        child: Column(
          children: [
            UsernameField(),
            SizedBox(height: 20),
            PasswordField(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LoginButton()
              ]
            ),            
          ],
        ),
      )
    );
  }

  Widget UsernameField(){
     return SizedBox(
        height: 10,
        child: TextFormField(
          style : TextStyle(
            fontSize: 8
          ),
          decoration: InputDecoration(
            labelText: "Username",
            labelStyle : TextStyle(
              fontSize: 8
            ),
            floatingLabelStyle : TextStyle(
              fontSize: 8
            ),
            errorStyle: TextStyle(
              fontSize: 8,          
            ),
          ),
          validator: (value) {        
            String? message = UtilValidators.required(value,fieldName : "Username");

            if(message != null){
              return message;
            }

            return null;
          },
          onSaved: (String? value) { 
            username = value.toString();
          },
        )
     );
  }

  Widget PasswordField(){
    return SizedBox(
      height: 10, 
      child: TextFormField(
        style : TextStyle(
          fontSize: 8
        ),
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle : TextStyle(
            fontSize: 8
          ),
          floatingLabelStyle : TextStyle(
            fontSize: 8
          ),
          errorStyle: TextStyle(
            fontSize: 8,          
          ),
        ),
        validator: (value){
          String fieldName = "Password";

          String? message = UtilValidators.required(value,fieldName : fieldName);

          if(message != null){
            return message;
          }

          message = UtilValidators.minLength(value,8,fieldName : fieldName);

          if(message != null){
            return message;
          }

          return null;
        },
        onSaved: (String? value) { 
          password = value.toString();
        },
      )
    );
  }

  Widget LoginButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), 
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isLoadingForm == true
              ? Spinner(icon: Icons.rotate_right)        
              : Icon(Icons.save_alt_outlined),
            Padding(
              padding: EdgeInsets.only(left : 1,right: 1),
              child : Text("Kirim")
            )
          ],
        )
      ),
      onPressed: (){
        if(formKey.currentState!.validate()){
            formKey.currentState?.save(); 
            onSubmit();
        }
      },
    );
  }

  void onSubmit() async {
    if(isLoadingForm) return;

    setState(() {    
      isLoadingForm = true;
    });    
    
    try{    
        var response = await http.post(
          Uri.parse(dotenv.env['API_URL']! + "/login"),
          headers : {
            "Content-Type": "application/json"
          },
          body : jsonEncode({
            "username" : username,
            "password" : password,
          })
        );    
        
        if(response.statusCode == 200){
          var responseBody = json.decode(response.body);

          if(AppPlatform.getPlatform() == 'Web'){            
            localStorage.setItem("token",'Bearer ' + responseBody["token"]);
          }else{
            await AppStorage.Secure.write(key: "token", value: 'Bearer ' + responseBody["token"]);
          }

          final userService = MeService();

          final user = await userService.getMe();

          userProvider.setUser(
              ModelUser(
                id : user?.id,
                username : user?.username,
                fullname : user?.fullname
              )
            );

          userProvider.setIsLogin(true);        
        }else{        
          UtilFormats.formatErrorHttp(response,context);
        }
    }catch(e,stackTrace){
      print("Error : $e");

      debugPrintStack(stackTrace: stackTrace);
    } finally {
      setState(() {    
        isLoadingForm = false;
      });
    }
  }
}