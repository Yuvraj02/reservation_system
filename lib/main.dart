import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:reservation_system/reservation_screen.dart';
import 'package:reservation_system/train.dart';
import 'package:reservation_system/train_list.dart';
import 'package:reservation_system/train_list_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Reservation System'),
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
  List<Train> trainList = [
    Train(name: "Shatabdi", coachType: "CC", number: "12002", locations: ["Hazrat Nizamuddin", "Agra", "Gwalior", "Jhansi", "Lalitpur", "Bhopal", "Habibganj"]),
    Train(name: "Southern Expess", coachType: "Sleeper", number: "02723", locations: ["Hazrat Nizamuddin", "Agra", "Gwalior", "Jhansi", "Lalitpur", "Bhopal", "Indore", "Chennai"]),
    Train(
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
        ]),
    Train(
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
        ]),
  ];

  List<String> locations = [
    "Hazrat Nizamuddin",
    "Agra",
    "Gwalior",
    "Jhansi",
    "Bhopal",
    "Jabalpur",
  ];

  final fromLocationSelected = TextEditingController();


  String selectFromLocation="";//Boarding Point will be stored here
  String selectToLocation="";//Dropping point will be stored here
  final dropLocationSelected = TextEditingController();

  bool trainDeets(String fromLocation,String boardingLocation,List trainRoutList) {
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
    if ((from && to) && (fromLocation!=boardingLocation)) {
      return true;
    }
      return false;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(

              width: 400,
              decoration: BoxDecoration(
                      color: Colors.grey
              ),
              child: Column(
                children: [
                  DropDownField(
                    controller: fromLocationSelected,
                    labelText: "Choose Your Boarding Point",
                    required: true,
                    enabled: true,
                    items: locations,
                    onValueChanged: (value){
                      setState(() {
                        selectFromLocation=value;
                        print(selectFromLocation);
                      });
                    }
                  ),
                  DropDownField(
                      controller: dropLocationSelected,
                      labelText: "Choose Your Dropping Point",
                      required: true,
                      enabled: true,
                      strict: false,
                      items: locations,
                      onValueChanged: (value){
                        setState(() {
                          selectToLocation=value;
                          print(selectToLocation);
                        });
                      }
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height-300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: ListView.builder(
                        itemCount:trainList.length,
                        itemBuilder: (context,index){
                      if(trainDeets(selectFromLocation, selectToLocation, trainList[index].locations)){
                        return SortedTrainList(trainList[index]);
                      }else{
                        return Text("");
                      }
                    }),
                  )
                ],
              ),
            ),
            RaisedButton(child: Text("Book Now"),onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Reservation(trainList: trainList[0]);
              }));
            }),
          ],
        ),
      ),
    );
  }
}
