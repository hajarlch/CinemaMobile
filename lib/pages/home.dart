import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exammobile/widgets/nav-drawer.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/cinema1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
                  children: <Widget>[
                    SizedBox(height: 100,),
                    Center(child: Text('Welcome to our App ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),)),
                    SizedBox(height: 10,),
                    Center(child: Text('Our team :',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight:FontWeight.bold ))),
                    SizedBox(height: 10,),
                    Center(child: Text('BOUCHRA ZAKY ')),
                    Center(child: Text('HAJAR LAHRECH ')),
                    Center(child: Text('AYA ASSAD ')),
                    Center(child: Text('FATIMA EZZAHRA CHAOUFI ')),

                  ],

            ),
          ),
        ),


      ),
    );
  }
}