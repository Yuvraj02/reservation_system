import 'package:flutter/material.dart';
import 'package:reservation_system/train.dart';
import 'main.dart';

class SortedTrainList extends StatefulWidget {

  Train train;

  SortedTrainList(this.train);

  @override
  _SortedTrainListState createState() => _SortedTrainListState();
}

class _SortedTrainListState extends State<SortedTrainList> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){},
        title: Text(widget.train.name),
      ),
    );
  }
}
