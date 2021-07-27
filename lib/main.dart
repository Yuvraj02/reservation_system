
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_system/provider.dart';

import 'package:reservation_system/train_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrainProvider>(
      create: (context) => TrainProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Reservation System'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Train> trainList = [
  //   Train(name: "Shatabdi", coachType: "CC", number: "12002", locations: [
  //     "Hazrat Nizamuddin",
  //     "Agra",
  //     "Gwalior",
  //     "Jhansi",
  //     "Lalitpur",
  //     "Bhopal",
  //     "Habibganj"
  //   ]),
  //   Train(
  //       name: "Southern Expess",
  //       coachType: "Sleeper",
  //       number: "02723",
  //       locations: [
  //         "Hazrat Nizamuddin",
  //         "Agra",
  //         "Gwalior",
  //         "Jhansi",
  //         "Lalitpur",
  //         "Bhopal",
  //         "Indore",
  //         "Chennai"
  //       ]),
  //   Train(
  //       name: "Rajdhani Express",
  //       coachType: "AC",
  //       number: "12122",
  //       locations: [
  //         "Hazrat Nizamuddin",
  //         "Agra",
  //         "Gwalior",
  //         "Jhansi",
  //         "Lalitpur",
  //         "Bhopal"
  //       ]),
  //   Train(
  //       name: "Jabalpur-NZM Express",
  //       coachType: "AC-Sleeper",
  //       number: "12181",
  //       locations: [
  //         "Hazrat Nizamuddin",
  //         "Agra",
  //         "Gwalior",
  //         "Jhansi",
  //         "Lalitpur",
  //         "Jabalpur"
  //       ]),
  // ];
  //
  // List<String> locations = [
  //   "Hazrat Nizamuddin",
  //   "Agra",
  //   "Gwalior",
  //   "Jhansi",
  //   "Bhopal",
  //   "Jabalpur",
  // ];
  //
  // final fromLocationSelected = TextEditingController();
  //
  // String? selectFromLocation =
  //     "Hazrat Nizamuddin"; //Boarding Point will be stored here
  // String? selectToLocation = "Agra"; //Dropping point will be stored here
  // final dropLocationSelected = TextEditingController();
  // String nameValue = "";
  // String trainSelected = "None";
  //
  // bool trainDeets(
  //     String? fromLocation, String? boardingLocation, List trainRoutList) {
  //   bool from = false;
  //   bool to = false;
  //
  //   for (int i = 0; i < trainRoutList.length; i++) {
  //     if (trainRoutList[i] == fromLocation) {
  //       from = true;
  //       print(trainRoutList[i]);
  //     }
  //     if (trainRoutList[i] == boardingLocation) {
  //       to = true;
  //       print("To Matched");
  //     }
  //   }
  //   if ((from && to) && (fromLocation != boardingLocation)) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // Train trainDetails(String trainName) {
  //   for (int i = 0; i < trainList.length; i++) {
  //     if (trainList[i].name == trainName) {
  //       return trainList[i];
  //     }
  //   }
  //   return Train(name: "", coachType: "", number: "", locations: []);
  // }

  //TrainProvider trainProvider = new TrainProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        elevation: 0,
        backgroundColor: new Color(0xFF0e1a73),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 400,
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Consumer<TrainProvider>(
                      builder: (context, provider, child) {
                        return Row(
                          children: [
                            Container(
                              //margin: EdgeInsets.all(16),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: new Color(0xFF0e1a73),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: DropdownButton<String>(
                                      dropdownColor: new Color(0xFF0e1a73),
                                      items: provider.locations
                                          .map((String dropDownListItem) {
                                        return DropdownMenuItem<String>(
                                            value: dropDownListItem,
                                            child: Text(
                                              dropDownListItem,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ));
                                      }).toList(),
                                      onChanged: (newValueSelected) {
                                        provider.selectedFromLocation(newValueSelected);
                                      },
                                      value: provider.selectFromLocation,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DropdownButton<String>(
                                    dropdownColor: new Color(0xFF0e1a73),
                                    items: provider.locations
                                        .map((String dropDownListItem) {
                                      return DropdownMenuItem<String>(
                                          value: dropDownListItem,
                                          child: Text(
                                            dropDownListItem,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ));
                                    }).toList(),
                                    onChanged: (newValueSelected) {
                                      provider.selectedToLocation(newValueSelected);
                                    },
                                    value: provider.selectToLocation,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Consumer<TrainProvider>(builder: (context,provider,child){
                    return RaisedButton(
                      child: Text(
                        "Show Trains",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        provider.showTrainButton(true);
                      },
                      color: new Color(0xFF0e1a73),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    );
                  },),
                  Consumer<TrainProvider>(builder: (context,provider,child){
                    return Container(
                      height: MediaQuery.of(context).size.height - 500,
                      width: 390,
                      decoration: BoxDecoration(
                        color: new Color(0xFF0e1a73),
                      ),
                      child: TrainTile(),
                    );
                  },),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Consumer<TrainProvider>(builder: (context,provider,child){
               return  TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.contact_page_rounded),
                      labelText: "Enter Your Name",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide())),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                  onChanged: (nm) {
                    //username Of the person
                    provider.nameValue = nm;
                  },
                );
              },),
            ),
            Consumer<TrainProvider>(builder: (context,provider,child){
             return Container(
                width: 500,
                height: 50,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 10),
                decoration: BoxDecoration(),
                child: Center(
                    child: Text(
                      "Selected Train is : ${provider.trainSelected}",
                      style: TextStyle(color: new Color(0xFF0e1a73), fontSize: 18),
                    )),
              );
            }),
            Consumer<TrainProvider>(builder: (context,provider,child){
              return RaisedButton(
                child: Text(
                  "Book Now",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  provider.ticketPage(context);
                },
                color: new Color(0xFF0e1a73),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}
