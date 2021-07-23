import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_system/main.dart';
import 'package:reservation_system/train_list.dart';
import 'train.dart';

class Reservation extends StatefulWidget{

  Train trainList;

  Reservation({required this.trainList});

  _ReservationState_ createState() => _ReservationState_();

}

class _ReservationState_ extends State<Reservation>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation Screen"),
      ),
      body: Column(children:[Text(widget.trainList.name),Text(widget.trainList.coachType),Text(widget.trainList.number),Text(widget.trainList.locations[0])],),
    );
  }
}