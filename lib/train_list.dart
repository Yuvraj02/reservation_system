import 'package:flutter/material.dart';
import 'main.dart';

class ItemList extends StatefulWidget {
  String train_name;
  String train_coach;
  int train_number;


  ItemList({required this.train_name,required this.train_coach, required this.train_number});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  int _counter = 1;
  int _totalPrice = 0;

  void decrement() {
    if (_counter < 1) {
      print("Cannot be less than 1");
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  void increment() {
    setState(() {
      _counter++;
    });
  }

  int totalPrice(){
    _totalPrice=_counter;
    return _totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10,10,20,10),
            width: 120,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: Text(widget.train_name),
          ),
          Container(
            width: 120,
            margin: EdgeInsets.fromLTRB(0, 8, 10, 10),
            child:Padding(padding:EdgeInsets.fromLTRB(0, 20, 0,0),child:Column(
              children: [
                Align(alignment:Alignment.centerLeft,child:Text(widget.train_coach,style: TextStyle(fontSize: 12,fontFamily: 'Poppins',color: new Color(0xFF7954ba)),),),
                Align(alignment:Alignment.centerLeft,child:Padding(padding:EdgeInsets.only(top: 10),child:Text("\$${widget.train_number}",style: TextStyle(fontSize: 16,fontFamily: 'Poppins',color: new Color(0xFF7153a6)),),)),

              ],
            ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40,5,0,0),
            child:Padding(padding:EdgeInsets.only(top: 10),child: Column(
              children: [
                new GestureDetector(
                  onTap: () {
                    decrement();
                    print(_counter);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 1, 0, 10),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          new BoxShadow(color: Colors.grey, blurRadius: 20.0)
                        ]),
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.white,
                      child: Stack(
                        children: [
                          Text("-"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text("$_counter",style: TextStyle(fontFamily: 'Poppins')),
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 9),
                ),
                new GestureDetector(
                  onTap: () {
                    increment();
                    print(_counter);
                  },
                  child: Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          new BoxShadow(color: Colors.grey, blurRadius: 4.0)
                        ]),
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: new Color(0xFF98d2ed),
                      child: Stack(
                        children: [
                          Text("+",style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}


