import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/train.dart';

class Reservation extends StatefulWidget {

  Train trainDeets;

  String userName;

  String? fromLocation;

  String? toLocation;

  Reservation(
      this.userName, this.trainDeets, this.fromLocation, this.toLocation);

  _ReservationState_ createState() => _ReservationState_();
}

class _ReservationState_ extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "Confirm Ticket",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(16),
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: new Color(0xFF0e1a73),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Train Name : ${widget.trainDeets.name}",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Coach Type : ${widget.trainDeets.coachType}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Train Number :${widget.trainDeets.number}",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "From: ${widget.fromLocation}, To : ${widget.toLocation}",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Passenger Details: ",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Name : ${widget.userName}",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Age : 19",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Email : yuvrajsinghbhadoria@gmail.com",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Phone Number : +91-8770805985",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "PNR No. : 102817005985",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Subtotal : ₹500.00",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "GST : ₹25.49",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Total : ₹525.49",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              )),
          RaisedButton(
            child: Text(
              "Confirm Ticket",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Ticket Confirmed"),
              ));
            },
            color: new Color(0xFF0e1a73),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }
}
