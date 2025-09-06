import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../providers/user.dart';
import "../../../core/widgets/spinner.dart";
import  "../../../models/user.dart";
import "../../../services/me.dart";
import "../../../configs/colors.dart";

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
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        labelStyle : TextStyle(
          fontSize: 10
        )
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
      style : TextStyle(
        fontSize: 10 
      ),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle : TextStyle(
          fontSize: 10
        ),
        floatingLabelStyle : TextStyle(
          fontSize: 8
        ),errorStyle: TextStyle(
      color: Colors.red,       // warna font error
      fontSize: 14,            // ukuran font
      fontWeight: FontWeight.bold, // tebal
      fontStyle: FontStyle.italic, // miring
    ),
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

  Widget LoginButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
         foregroundColor: AppColors.textSecondary,
        backgroundColor:  isLoadingForm == true 
          ? Colors.grey
          : AppColors.backgroundPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18), // radius sudut
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // optional
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isLoadingForm == true
              ? Spinner(icon: Icons.rotate_right)        
              : Icon(Icons.save_alt_outlined),
            Padding(
              padding: EdgeInsets.only(left : 1),
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

          final storage = const FlutterSecureStorage();

          await storage.write(key: "token", value: 'Bearer ' + responseBody["token"]);

          final userService = MeService();
          final user = await userService.getMe();

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
      print("Error : $e");
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      setState(() {    
        isLoadingForm = false;
      });
    }
  }
}