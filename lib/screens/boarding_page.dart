import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:reservation_system/providers/form_provider.dart';
import 'package:reservation_system/screens/registration_page.dart';
import 'package:reservation_system/screens/splash_Screen.dart';
import 'package:reservation_system/screens/home_screen.dart';
import 'package:reservation_system/screens/login_page.dart';

class BoardingPage extends StatelessWidget {

  Widget build(BuildContext context) {
    FormProvider auth = Provider.of<FormProvider>(context);
    print(auth.states);
    print("user name is: ${auth.userDataModel.userName}");
    print("Password is : ${auth.userDataModel.password}");
    switch(auth.states){
      case AuthStates.authenticating:
        return SplashScreen();
        break;
      case AuthStates.authenticated:
        return HomeScreen();
        break;
      case AuthStates.unAuthenticated:
        return LoginScreen();
        break;
      case AuthStates.newUser:
        return RegistrationPage();
        break;
      default:
        return Text("Error");
    }
  }
}

