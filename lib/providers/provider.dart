import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_system/screens/reservation_screen.dart';
import 'package:reservation_system/models/train.dart';

class TrainProvider extends ChangeNotifier {

  TrainProvider(){
    getTrainList();
  }


  bool showTrains = false;
  final fromLocationSelected = TextEditingController();
  String? selectFromLocation = "Hazrat Nizamuddin"; //Boarding Point will be stored here
  String? selectToLocation = "Agra"; //Dropping point will be stored here
  final dropLocationSelected = TextEditingController();
  String nameValue = "";
  String? trainSelected = "None";
  List<Train> trainList = [];
  List<String> locations = ["Hazrat Nizamuddin", "Agra", "Gwalior", "Jhansi", "Bhopal", "Jabalpur",];

  bool trainDeets(String? fromLocation, String? boardingLocation, List? trainRoutList) {
    bool from = false;
    bool to = false;

    for (int i = 0; i < trainRoutList!.length; i++) {
      if (trainRoutList[i] == fromLocation) {
        from = true;
        print(trainRoutList[i]);
      }
      if (trainRoutList[i] == boardingLocation) {
        to = true;
        print("To Matched");
      }
    }
    if ((from && to) && (fromLocation != boardingLocation)) {
      return true;
    }
    return false;
  }

  Train trainDetails(String? trainName) {
    for (int i = 0; i < trainList.length; i++) {
      if (trainList[i].name == trainName) {
        return trainList[i];
      }
    }
    return Train(name: "", coachType: "", number: "", locations: []);
  }

  void trainAssign(String? trainName) {
    trainSelected = trainName;
    notifyListeners();
  }

  void ticketPage(BuildContext context) {
    if (trainSelected == "None" || nameValue == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please Check all the inputs again"),
      ));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Reservation(nameValue, trainDetails(trainSelected),
            selectFromLocation, selectToLocation);
      }));
    }
  }

  void showTrainButton(bool state) {
    showTrains = true;
    notifyListeners();
  }

  void selectedFromLocation(String? loc) {
    selectFromLocation = loc;
    showTrains = false;
    notifyListeners();
  }

  void selectedToLocation(String? loc) {
    selectToLocation = loc;
    showTrains = false;
    notifyListeners();
  }

  void getTrainList()async{

    await FirebaseFirestore.instance.collection("Train").get().then((snap){
      snap.docs.forEach((element) {
        print(element.data());
        trainList.add(Train.fromJson(element.data()));
      });
    });
  }

  
}
