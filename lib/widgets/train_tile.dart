import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_system/providers/provider.dart';

class TrainTile extends StatefulWidget{
  TrainTile();
  _TrainTileState_ createState() => _TrainTileState_();
}

class _TrainTileState_ extends State<TrainTile>{

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainProvider>(
      builder: (context,trainProvider,child){
        return ListView.builder(
            itemCount: trainProvider.trainList.length,
            itemBuilder: (context, index) {
              if (trainProvider.trainDeets(trainProvider.selectFromLocation, trainProvider.selectToLocation,
                  trainProvider.trainList[index].locations) && trainProvider.showTrains) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      trainProvider.trainAssign(trainProvider.trainList[index].name);
                      print(trainProvider.trainSelected);
                    },
                    leading: Text(trainProvider.trainList[index].number),
                    title: Text(trainProvider.trainList[index].name),
                    subtitle: Text(trainProvider.trainList[index].coachType),
                  ),
                );
              } else {
                return SizedBox(width: 0,height: 0,);
              }
            });
      },
    );
  }
}
