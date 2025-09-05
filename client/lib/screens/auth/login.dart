import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../providers/user.dart';
import "../../core/widgets/spinner.dart";
import  "../../models/user.dart";
import "../../services/me.dart";
import "../dashboard.dart";

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
      home : Scaffold(      
        body : Padding(
          padding : EdgeInsets.only(
            left : 20,
            right : 20
          ),
          child : Column(    
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(                      
                child: Image.asset(
                  'images/logo.png',
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 200,
                )
              ),            
              SigninScreen(context),        
            ]
          )
        )
      )
    );
  }
}

class SigninScreen extends StatefulWidget{
  final BuildContext parentContext;

  SigninScreen(this.parentContext);

  @override 
  SigninScreenState createState() => SigninScreenState(this.parentContext);
}

class SigninScreenState extends State<SigninScreen>{
  final BuildContext parentContext;

  SigninScreenState(this.parentContext);

  final formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  bool isLoadingForm = false;

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
            PasswordField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SigninButton()
              ]
            ),            
          ],
        ),
      )
    );
  }

  Widget UsernameField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
      ),
      validator: (value) {        
        if(value!.isEmpty){
          return "Username tidak boleh kosong";
        }

        return null;
      },
      onSaved: (String? value) { 
        username = value.toString();
      },
    );
  }

  Widget PasswordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
      ),
      validator: (value){
        if(value!.isEmpty){
          return "Password tidak boleh kosong";
        }

        if(value.length <= 7){
          return "Password tidak boleh kurang dari 8";
        }

        return null;
      },
      onSaved: (String? value) { 
        password = value.toString();
      },
    );
  }

  Widget SigninButton(){
    return ElevatedButton(
  
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isLoadingForm == true
              ? Spinner( icon: Icons.rotate_right )        
              : Icon( Icons.save),
            Padding(
              padding: EdgeInsets.only(left : 5),
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

        if(response.statusCode == 404){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Url tidak ditemukan")),
          );
        }else if(response.statusCode == 422){
          var message = json.decode(response.body);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${message["message"]}")),
          );
        }else if(response.statusCode == 500){
          var message = json.decode(response.body);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Terjadi Kesalahan")),
          );
        }else if(response.statusCode == 200){
          var responseBody = json.decode(response.body);

          print(responseBody);

          final prefs = await SharedPreferences.getInstance();

          print("asd");

          await prefs.setString('token', 'Bearer ' + responseBody["token"]);
                    
          print("ASdad");
          final userService = MeService();
          final user = await userService.getMe();

          print(user);

          Provider.of<UserProvider>(context,listen: false).setUser(ModelUser(
            id : user?.id,
            username : user?.username,
            fullname : user?.fullname
          ));

          Provider.of<UserProvider>(context,listen: false).setIsLogin(true);        
        }else{

          print(response.statusCode);
          
        
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Terjadi Kesalahan")),
          );
        }
    }catch(e,stackTrace){
      print("ASD");
      print(e);

      debugPrintStack(stackTrace: stackTrace);

      ScaffoldMessenger.of(context).clearSnackBars();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Terjadi Kesalahan"),
          duration: Duration(seconds: 2),
        ),
      );
    } finally {

      setState(() {    
        isLoadingForm = false;
      });
    }
  }
}