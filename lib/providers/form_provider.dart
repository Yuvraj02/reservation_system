import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_system/models/user_model.dart';
import 'package:reservation_system/providers/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStates{
 authenticating,authenticated,unAuthenticated,newUser
}

class FormProvider extends ChangeNotifier{
  FormProvider(){
  //autoLogin();
  }

  AuthStates states = AuthStates.newUser;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String userName="";
  String password="";
  String? email;
  bool isPasswordSame=false;
  bool isLoadingAnimation = true;

 var userDataModel = UserModel();

  void setUserNameandPassword(String userNamefromTextField,String passwordfromTextField){
    userName = userNamefromTextField;
    password = passwordfromTextField;
  }

  Future<bool> saveUserData(String userNameValue,String passwordValue) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("username", userNameValue);
      sharedPreferences.setString("password", passwordValue);
      return sharedPreferences.commit();
  }

  Future<UserModel> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userDataModel.userName=sharedPreferences.getString("username");
    userDataModel.password=sharedPreferences.getString("password");
    return userDataModel;
  }

  Future<void> storeData()async{
   //print(await getUserData());
    await getUserData();
  }

  Future<bool> checkData()async{
    await storeData();
 if(userName==userDataModel.userName && userDataModel.password==password){
  states=AuthStates.authenticated;
   notifyListeners();
      return true;
    }
    return false;
  }

  void saveData(String registeredUserName,String registeredPassword){
   saveUserData(registeredUserName,registeredPassword);
    states=AuthStates.unAuthenticated;
    notifyListeners();
  }

  void printData() async{
    await getUserData();
    // print(userDataModel.userName);
    // print(userName);
}

bool isLoading(){
  Future.delayed(const Duration(milliseconds: 2000),(){
    isLoadingAnimation = false;
    notifyListeners();
  });
  return isLoadingAnimation;
}

bool loadHomeScreen(){
    if(!isLoadingAnimation){
      return true;
    }
    return false;
  }

   autoLogin()async{
    states = AuthStates.authenticating;
    await getUserData();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(userDataModel.userName == null || userDataModel.password==null){
      states=AuthStates.unAuthenticated;
    }else if(userDataModel.userName==sharedPreferences.getString("username") && userDataModel.password==sharedPreferences.getString("password")){
      states=AuthStates.authenticated;
    }else{
      states = AuthStates.unAuthenticated;
    }
    notifyListeners();
  }
  void register(){
    states=AuthStates.newUser;
    notifyListeners();
  }

  bool checkFields(String username,String password){
  if(username!="" && password !=""){
    return true;
  }
  return false;
  }

  registrationAuth(String email, String password)async{
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if(user!=null){

      }

      states=AuthStates.unAuthenticated;
      notifyListeners();
      // if(user.user != null){
      //   states=AuthStates.newUser;
      //   notifyListeners();
      //   return true;
      // }else{
      //   states=AuthStates.unAuthenticated;
      //   notifyListeners();
      //   return false;
      }
  }

  // Future<bool> loginAuth(String email, String password)async{
  //
  //   UserCredential user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //
  //   if(user.user != null){
  //     states=AuthStates.authenticated;
  //     await getUserData();
  //
  //     notifyListeners();
  //     return true;
  //   }else{
  //     states=AuthStates.unAuthenticated;
  //     notifyListeners();
  //     return false;
  //   }
  // }
