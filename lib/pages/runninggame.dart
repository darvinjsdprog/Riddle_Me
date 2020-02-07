import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riddle_me/appConfiguration.dart';
import 'package:riddle_me/models/contentofcategories.dart';
import 'package:riddle_me/models/gogame.dart';
import 'package:riddle_me/models/points.dart';
import 'package:riddle_me/models/team.dart';
import 'package:sensors/sensors.dart';
import 'package:wakelock/wakelock.dart';

class RunningGame extends StatefulWidget {
  @override
  _RunningGameState createState() => _RunningGameState();
}

class _RunningGameState extends State<RunningGame> {
  Config _config = new Config();
  Gogame gameconfig = new Gogame();
  ContentCategories cont = new ContentCategories();
  String message = 'Coloque el teléfono en la frente';
  String header = '';
  String earnedpoints = '0';
  Timer _timer;
  int _start = 4;
  int _startgame = 0;
  bool _isvisible = true;
  var _random = new Random();
  int roundtime;
  bool isgamerunning = false;
  bool isplaying = false;

  List<ContentCategories> contentlist = [];
  List<Points> points = [];

  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  void startTimer(bool isgamestart, String firstword) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (isgamestart) {
            if (_start < 2) {
              timer.cancel();
              header = '';
              isgamerunning = true;
               message = firstword;
              startTimer(false, firstword);
            } else {
              _start = _start - 1;
              header = _start.toString();
            }
          } else {
            isplaying = true;
            if (_startgame < 1) {
              timer.cancel();
              header = '';
              isplaying = false;
              stopgame();
            } else {
              _startgame = _startgame - 1;
              header = _startgame.toString();
            }
          }
        },
      ),
    );
  }

  void stopgame() {
    _isvisible = true;
    navigatetoScore();
  }
  
  void goodpoint(){
    savepoint(gameconfig.teams.first, message, true);
          message = contentlist[_random.nextInt(contentlist.length)]
                              .words
                              .toUpperCase();
          print('Punto valido');
  }

  void badpoint(){
    savepoint(gameconfig.teams.first, message, false);
          message = contentlist[_random.nextInt(contentlist.length)]
                              .words
                              .toUpperCase();
          print('Punto invalido');
  }

  void navigatetoScore(){
    Navigator.pushNamed(context, '/score_screen', arguments: points);
  }

  List<ContentCategories> getcontentofcategorie(int idcategorie) {
    var list = cont.getcontentcategorie(idcategorie);
    return list;
  }

  void savepoint(Team team, String word,  bool isvalid){
    points.add(new Points(team: team, words: word, isValid: isvalid));
    var point = points.where((t) => t.isValid == true);
    setState(() {
    earnedpoints = (point.length).toString();  
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _config.setAllConfig();
    Wakelock.enable();
    bool issafe = true;
    double rotationlimit = 9.5;

    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
    
        if(!isgamerunning && gameconfig != null && contentlist.isNotEmpty){
        if(double.parse(event.x.toStringAsFixed(1))  == -9.8 || double.parse(event.x.toStringAsFixed(1)) == 9.8){
           message = '';
          _isvisible = false;
          _startgame = gameconfig.setting.roundtime + 1;
          isgamerunning = true;
          String firstword = contentlist[_random.nextInt(contentlist.length)]
                                .words
                                .toUpperCase();
          startTimer(true, firstword);
        }
      }

      if(isgamerunning && isplaying){
          if(event.z > rotationlimit){
        if(issafe){
          issafe = false;
          badpoint();
        }
      } else if(event.z < -rotationlimit){
        if(issafe){
          issafe = false;
          goodpoint();
        }
      } else if(event.z.abs() > rotationlimit / 2){
        issafe = true;
      }
    }
    }));
  }

  @override
  Widget build(BuildContext context) {
    gameconfig = ModalRoute.of(context).settings.arguments;
    Color teamcolor = gameconfig.teams.first.color;
    contentlist = getcontentofcategorie(gameconfig.categories.idcategorie);
   
    return Scaffold(
      backgroundColor: teamcolor.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Visibility(
          visible: _isvisible,
          child: BackButton(),
        ),
        title: Text(
          header,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(210.0, 0, 150.0, 10.0),
          child: Container(
                    width: 200.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Aciertos:   ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            earnedpoints,
                            style: TextStyle(
                              color: Colors.green[300],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
        ),
      ),
    );
  }
}
