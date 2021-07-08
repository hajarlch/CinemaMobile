
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class GlobalParameter{
  static final email='hajar@gmail.com';
  static final password='123456';

  static final Map<int,YoutubePlayerController> controller={
    0: YoutubePlayerController(
        initialVideoId: 'aVdO-cx-McA', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        )),
    1: YoutubePlayerController(
        initialVideoId: '6IY5-IALivk', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        )),
    2: YoutubePlayerController(
        initialVideoId: 'gmRKv7n2If8', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        )),
    3: YoutubePlayerController(
        initialVideoId: '3od-kQMTZ9M', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        )),
    5: YoutubePlayerController(
        initialVideoId: 'qRQ8-Iq4RqA', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        )),
    6: YoutubePlayerController(
        initialVideoId: 'gzy6ORqE9IY', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        )),



  };
}