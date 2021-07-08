import 'package:exammobile/global/global.parameter.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trailer extends StatefulWidget {
  dynamic id;
  Trailer(this.id);

  @override
  _TrailerState createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {

  @override
  Widget build(BuildContext context) {
    return Container(
     child: YoutubePlayer(
        controller: GlobalParameter.controller[widget.id],
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.cyan[200],
      ),
    );
  }
}

