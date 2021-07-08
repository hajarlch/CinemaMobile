import 'dart:convert';


import 'package:exammobile/services/cinema-service.dart';
import 'package:exammobile/widgets/nav-drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'cinema-page.dart';


class VillePage extends StatefulWidget {

  @override
  _VillePageState createState() => _VillePageState();
}

class _VillePageState extends State<VillePage> {
  CinemaService get service => GetIt.I<CinemaService>();

  List<dynamic> listVilles  ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      loadVilles();
  }
  void loadVilles() async{
    CinemaService().getVilles().then((response){

          setState(() {
            listVilles=json.decode(response.body)["_embedded"]["villes"];
          });
        }).catchError((err){
          print(err);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Villes"),),
      body: Center(
        child: listVilles==null?CircularProgressIndicator()
        :ListView.builder(
            itemCount: (this.listVilles==null)?0:this.listVilles.length,
            itemBuilder: (context,index){
              return  InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CinemaPage(listVilles[index])));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(child: Text(listVilles[index]["name"],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
                      ),
                ),
              );
            }),
      ),
    );
  }
}
