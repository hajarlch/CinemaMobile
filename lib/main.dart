import 'package:exammobile/pages/camera.dart';
import 'package:exammobile/pages/home.dart';
import 'package:exammobile/pages/main1.dart';

import 'package:exammobile/pages/signin.dart';
import 'package:exammobile/pages/ville-page.dart';

import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/Home': (context) => MyHomePage(),
        '/SignIn': (context) =>SignIn(),
        '/Cinema':(contect)=>Cinema(),
        '/Camera':(contect)=>Camera(),
        '/VillePage':(contect)=>VillePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:SignIn(),
    );
  }
}

