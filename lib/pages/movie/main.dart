import 'package:exammobile/pages/movie/movie_api.dart';
import 'package:flutter/material.dart';

import 'movie_details_page.dart';




class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xFFFF5959),
      ),
      // home: MovieDetailsPage(),
    );
  }
}
