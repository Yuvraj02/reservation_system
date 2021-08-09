import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reservation_system/providers/form_provider.dart';


class LoginScreen extends StatefulWidget{
  LoginScreen();
  _LoginScreenSate_ createState() => _LoginScreenSate_();
}

class _LoginScreenSate_ extends State<LoginScreen>{

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: new Color(0xFF0e1a73),
      ),
      body: Center(

        child: Consumer<FormProvider>(
          builder: (context,provider,child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Text("Welcome",style: TextStyle(fontSize: 20),),Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: userController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () async{
                    if(provider.checkFields(userController.text, passwordController.text)){

                     provider.loginAuth(userController.text, passwordController.text);

                      // if(await provider.checkData()){
                      //   // provider.states=AuthStates.authenticated;
                      //   Fluttertoast.showToast(
                      //       msg: "Logging In",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.BOTTOM,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: new Color(0xFF0e1a73),
                      //       textColor: Colors.white,
                      //       fontSize: 16.0
                      //   );
                      // }else{
                      //   Fluttertoast.showToast(
                      //       msg: "Invalid Username or Password",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.BOTTOM,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: new Color(0xFF0e1a73),
                      //       textColor: Colors.white,
                      //       fontSize: 16.0
                      //   );
                      // }
                    }else{
                      Fluttertoast.showToast(
                          msg: "Username/Password cannot be empty",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: new Color(0xFF0e1a73),
                    textColor: Colors.white,
                    fontSize: 16.0,
                      );
                    }
                  },
                  color: new Color(0xFF0e1a73),
                  child: Text("Log in",style: TextStyle(color: Colors.white),),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () async{
                    provider.register();
                  },
                  color: new Color(0xFF0e1a73),
                  child: Text("Register",style: TextStyle(color: Colors.white),),
                ),
              ],
            );
          },
        )
      ),
    );
  }
}