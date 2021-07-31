import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_system/screens/reservation_screen.dart';
import 'package:reservation_system/models/train.dart';

class TrainProvider extends ChangeNotifier {
  bool showTrains = false;
  final fromLocationSelected = TextEditingController();
  String? selectFromLocation = "Hazrat Nizamuddin"; //Boarding Point will be stored here
  String? selectToLocation = "Agra"; //Dropping point will be stored here
  final dropLocationSelected = TextEditingController();
  String nameValue = "";
  String trainSelected = "None";
  List<Train> trainList = [Train(name: "Shatabdi", coachType: "CC", number: "12002", locations: [
      "Hazrat Nizamuddin",
      "Agra",
      "Gwalior",
      "Jhansi",
      "Lalitpur",
      "Bhopal",
      "Habibganj"
    ]), Train(
        name: "Southern Expess",
        coachType: "Sleeper",
        number: "02723",
        locations: [
          "Hazrat Nizamuddin",
          "Agra",
          "Gwalior",
          "Jhansi",
          "Lalitpur",
          "Bhopal",
          "Indore",
          "Chennai"
        ]), Train(
        name: "Rajdhani Express",
        coachType: "AC",
        number: "12122",
        locations: [
          "Hazrat Nizamuddin",
          "Agra",
          "Gwalior",
          "Jhansi",
          "Lalitpur",
          "Bhopal"
        ]), Train(
        name: "Jabalpur-NZM Express",
        coachType: "AC-Sleeper",
        number: "12181",
        locations: [
          "Hazrat Nizamuddin",
          "Agra",
          "Gwalior",
          "Jhansi",
          "Lalitpur",
          "Jabalpur"
        ]),];

  List<String> locations = ["Hazrat Nizamuddin", "Agra", "Gwalior", "Jhansi", "Bhopal", "Jabalpur",];

  bool trainDeets(String? fromLocation, String? boardingLocation, List trainRoutList) {
    bool from = false;
    bool to = false;

    for (int i = 0; i < trainRoutList.length; i++) {
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

  Train trainDetails(String trainName) {
    for (int i = 0; i < trainList.length; i++) {
      if (trainList[i].name == trainName) {
        return trainList[i];
      }
    }
    return Train(name: "", coachType: "", number: "", locations: []);
  }

  void trainAssign(String trainName) {
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
}
