
import 'package:exammobile/pages/ville-page.dart';
import 'package:exammobile/services/cinema-service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'menu-itme.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => CinemaService());

}

// void main(){
//    setupLocator();
//   runApp(MaterialApp(
//     theme: ThemeData(
//       appBarTheme: AppBarTheme(color: Colors.orange),
//
//     ),
//     home: MyApp(),
//   ));
// }

class Cinema extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Cinema> {
  var menus=[
    {"title":"Home","icon":Icon(Icons.home),"page":Cinema()},
    {"title":"Ville","icon":Icon(Icons.location_city),"page":VillePage()},


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  // child: CircleAvatar(
                  //   // backgroundImage: AssetImage("./images/profile.jpg"),
                  //   radius: 30,
                  // ),
                ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.orange]
                )
              ),
            ),
            ...menus.map((item) {
             return Column(
               children: [
                 MenuItem(item["title"], item["icon"], item["page"]),
                 Divider(color: Colors.orange,)
               ],
             );
            })
          ],
        ),
      ),
      appBar: AppBar(title: Text("Cinema page")),
      body: Center(child: Text("Home Cinema ..."),),
    );
  }
}

