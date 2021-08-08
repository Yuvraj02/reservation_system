import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reservation_system/providers/form_provider.dart';

class RegistrationPage extends StatefulWidget {

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: new Color(0xFF0e1a73),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<FormProvider>(builder: (context, provider, child) {
                return Row(
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 180,
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userNameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email-ID',
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Password',
                ),
              ),
            ),

            Consumer<FormProvider>(builder: (context, provider, child) {
              return RaisedButton(
                onPressed: () {
                  if(provider.checkFields(userNameController.text, passwordController.text)){
                    provider.saveData(userNameController.text,passwordController.text);
                    provider.registrationAuth(emailController.text, passwordController.text);
                  }else{
                    Fluttertoast.showToast(
                        msg: "Please enter Username and Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: new Color(0xFF0e1a73),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }

                  // provider.printData();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //       return LoginScreen();
                  //     }));

                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                color: new Color(0xFF0e1a73),
                child: Text("Register",style: TextStyle(color: Colors.white),),
              );
            }),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
