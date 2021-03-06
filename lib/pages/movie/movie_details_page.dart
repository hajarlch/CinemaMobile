

import 'package:exammobile/pages/movie/trailer.dart';
import 'package:exammobile/pages/movie/story_line.dart';
import 'package:flutter/material.dart';

import 'actor_scroller.dart';
import 'models.dart';
import 'movie_detail_header.dart';


class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" ${movie.title}"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Storyline(movie.storyline),
            ),
            Trailer(movie.id),
            SizedBox(height: 20.0),
            ActorScroller(movie.actors),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
