import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_system/providers/form_provider.dart';

import 'package:reservation_system/screens/boarding_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormProvider>(
      create: (context) => FormProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BoardingPage(),
      ),
    );
  }
}

