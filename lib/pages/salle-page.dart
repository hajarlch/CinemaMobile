import 'dart:convert';



import 'package:exammobile/pages/Projection.dart';
import 'package:exammobile/services/cinema-service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SallePage extends StatefulWidget {
  dynamic cinema;
  SallePage(this.cinema);
  @override
  _SallePageState createState() => _SallePageState();
}

class _SallePageState extends State<SallePage> {
  List<dynamic> listSalles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCinemas();
  }
  void loadCinemas() {

    CinemaService().getSalles(widget.cinema['_links']['salles']['href']).then((response){
      setState(() {
        listSalles=json.decode(response.body)["_embedded"]["salles"];
        print(listSalles[1]["name"]);
      });
    }).catchError((err){
      print(err);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cinémas de ${widget.cinema["name"]}"),),
      body:Center(
        child:listSalles==null?CircularProgressIndicator()
            :CustomScrollView(
          slivers: [
               SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),

          delegate: SliverChildBuilderDelegate(
              (context,index) => InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProjectionPage(listSalles[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height:20 ,),
                            Text(listSalles[index]["name"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            SizedBox(height:10 ,),
                            Text('Nombre de places :  '+listSalles[index]["nombrePlace"].toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                childCount:(this.listSalles==null)?0:this.listSalles.length, ),
              ),
          ]
            ),

      ),

    );
  }
}
