import 'dart:convert';
import 'dart:math';


import 'package:exammobile/global/global.parameter.dart';
import 'package:exammobile/pages/movie/movie_api.dart';
import 'package:exammobile/pages/movie/movie_details_page.dart';
import 'package:exammobile/services/cinema-service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'movie/main.dart';
class ProjectionPage extends StatefulWidget {
  dynamic salle;
  ProjectionPage(this.salle);
  @override
  _ProjectionPageState createState() => _ProjectionPageState();
}

class _ProjectionPageState extends State<ProjectionPage> {
  List<dynamic> listProjections;
  dynamic film;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCinemas();
  }
  void loadCinemas() {

    CinemaService().getProjections(widget.salle['_links']['projections']['href']).then((response){
      setState(() {
        listProjections=json.decode(response.body)["_embedded"]["projections"];

      });
    }).catchError((err){
      print(err);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Film'),
        backgroundColor: Colors.red,
      ),
      body:Center(
        child:listProjections==null?CircularProgressIndicator()
            :CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),

                delegate: SliverChildBuilderDelegate(

                      (context,index) =>

                          InkWell(

                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsPage(movies[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('${movies[index].bannerUrl}'),
                              fit: BoxFit.cover,

                            ),
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

                      ),
                    ),
                  ),
                  childCount:6 ),
              ),
            ]
        ),

      ),

    );
  }
}
