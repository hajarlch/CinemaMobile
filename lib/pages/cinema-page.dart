import 'dart:convert';


import 'package:exammobile/pages/salle-page.dart';
import 'package:exammobile/services/cinema-service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CinemaPage extends StatefulWidget {
  dynamic ville;
  CinemaPage(this.ville);
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  List<dynamic> listCinemas;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCinemas();
  }
  void loadCinemas() {
      print(widget.ville['_links']['cinemas']['href']);
       CinemaService().getCinemas(widget.ville['_links']['cinemas']['href']).then((response){
       setState(() {
         listCinemas=json.decode(response.body)["_embedded"]["cinemas"];
         print(listCinemas[1]["name"]);
       });
     }).catchError((err){
       print(err);
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cinémas de ${widget.ville["name"]}"),),
      body:Center(
        child: listCinemas==null?CircularProgressIndicator()
            :ListView.builder(
            itemCount: (this.listCinemas==null)?0:this.listCinemas.length,
            itemBuilder: (context,index){
              return  InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SallePage(listCinemas[index])));
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
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          Center(child: Text(listCinemas[index]["name"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                          Text('Nombre de salle :  '+listCinemas[index]["nombreSalles"].toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey),),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
