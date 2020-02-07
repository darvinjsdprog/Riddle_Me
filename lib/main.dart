import 'package:flutter/material.dart';
import 'package:riddle_me/pages/addplayers.dart';
import 'package:riddle_me/pages/home.dart';
import 'package:riddle_me/pages/loading.dart';
import 'package:riddle_me/pages/playgame.dart';
import 'package:riddle_me/pages/runninggame.dart';
import 'package:riddle_me/pages/score_screen.dart';
import 'package:riddle_me/pages/settings.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/setting': (context) => Settings(),
      '/addplayer': (context) => AddPlayers(),
      '/playgame': (context) => PlayGame(),
      '/runninggame': (context) => RunningGame(),
      '/score_screen': (context) => Score(),
    },
  )
);

