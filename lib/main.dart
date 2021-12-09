import 'package:flutter/material.dart';
import 'package:flutterpackage/Views/Home.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.presentError(details);
  //   if (kReleaseMode) exit(1);
  // };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wallPaper',
      theme: ThemeData(primaryColor: Colors.green),
      debugShowCheckedModeBanner: false,

      home: Home(),
      // home: Scaffold(
      //   // appBar: AppBar(title: Text('Food App'),),
      //   // body: Row(children: [
      //   //   Text('Welcome to our store'),
      //   //   Text('Welcome to our store'),
      //   //   Text("my Name is ${name}"),
      //   //   ElevatedButton(onPressed: changeName, child: Text('CLick Me'))
      //   //   TextField(onChanged: myInputs,)
      //   // ]),

      //   appBar: AppBar(title: Text("Image loader")),

      // ),
    ); //it create the layout of the page
  }
}
