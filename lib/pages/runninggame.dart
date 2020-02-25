import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:riddle_me/appConfiguration.dart';
import 'package:riddle_me/models/contentofcategories.dart';
import 'package:riddle_me/models/gogame.dart';
import 'package:riddle_me/models/points.dart';
import 'package:riddle_me/models/team.dart';
import 'package:sensors/sensors.dart';
import 'package:vibration/vibration.dart';
import 'package:wakelock/wakelock.dart';

class RunningGame extends StatefulWidget {
  @override
  _RunningGameState createState() => _RunningGameState();
}

class _RunningGameState extends State<RunningGame> {
  Config _config = new Config();
  Gogame gameconfig = new Gogame();

  static AudioCache audioCache = AudioCache();
  AudioPlayer player = AudioPlayer();

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
  bool isaPoint = false;
  bool pointPressed = false;
  int _animateDuration = 70;

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
              player.stop();
              stopgame();
            } else {
              _startgame = _startgame - 1;
              header = _startgame.toString();
              if (_startgame == 15) {
                handleSounds(true);
              }
            }
          }
        },
      ),
    );
  }

  void stopgame() async {
    isgamerunning = false;
    isplaying = false;
    message = 'EL JUEGO TERMINO !';
    await handleVibration(true, true);
    _isvisible = true;
    navigatetoScore();
  }

  void goodpoint() async {
    if (isplaying) {
      setState(() {
        isaPoint = true;
        pointPressed = true;
      });
      handlePointSounds(true);
      handleVibration(isaPoint, false);
      await Future.delayed(Duration(milliseconds: _animateDuration), () {
        savepoint(gameconfig.teams.first, message, true);
        message = contentlist[_random.nextInt(contentlist.length)]
            .words
            .toUpperCase();
        print('Punto valido');
      });
    }
  }

  void badpoint() async {
    if (isplaying) {
      setState(() {
        isaPoint = false;
        pointPressed = true;
      });
      handlePointSounds(false);
      handleVibration(isaPoint, false);
      await Future.delayed(Duration(milliseconds: _animateDuration), () {
        savepoint(gameconfig.teams.first, message, false);
        message = contentlist[_random.nextInt(contentlist.length)]
            .words
            .toUpperCase();
        print('Punto invalido');
      });
    }
  }

  Future<void> handleVibration(bool isPoint, bool gamefinish) async {
    if (gameconfig != null) {
      if (gameconfig.setting.vibration) {
        if (await Vibration.hasVibrator()) {
          if (!gamefinish) {
            if (isPoint) {
              await Vibration.vibrate(duration: 500);
            } else {
              await Vibration.vibrate(duration: 750);
            }
          } else {
            await Vibration.vibrate(duration: 2000);
          }
        }
      }
    }
  }

  handlePointSounds(bool good) async {
    try {
      if (gameconfig != null) {
        if (gameconfig.setting.sound) {
          if (good) {
            player = await audioCache.play('GoodPoint.mp3');
          } else {
            player = await audioCache.play('BadPoint.mp3');
          }
        }
      }
    } catch (e) {}
  }

  void handleSounds(bool willPlay) async {
    try {
      if (gameconfig != null) {
        if (gameconfig.setting.sound) {
          if (willPlay) {
            player = await audioCache.play('TimesRunning.wav');
            print(player);
          } else {
            player.stop();
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void navigatetoScore() {
    Navigator.pushNamed(context, '/score_screen', arguments: points);
  }

  List<ContentCategories> getcontentofcategorie(int idcategorie) {
    var list = cont.getcontentcategorie(idcategorie);
    return list;
  }

  void savepoint(Team team, String word, bool isvalid) {
    points.add(new Points(team: team, words: word, isValid: isvalid));
    var point = points.where((t) => t.isValid == true);
    setState(() {
      earnedpoints = (point.length).toString();
    });
  }

  @override
  void dispose() {
    try {
      _timer.cancel();
      for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
        subscription.cancel();
      }
    } catch (e) {
      print(e);
    }
    super.dispose();
  }

  @override
  void initState() {
    try {
      _config.setAllConfig();
      Wakelock.enable();
      bool issafe = true;
      double rotationlimit = 9.5;
      bool isForhead = false;

      _streamSubscriptions
          .add(accelerometerEvents.listen((AccelerometerEvent event) {
        if (double.parse(event.z.toStringAsFixed(1)) < 2.0 &&
            double.parse(event.z.toStringAsFixed(1)) > -2.0) {
          isForhead = true;
        }

        if (!isgamerunning && gameconfig != null && contentlist.isNotEmpty) {
          if (double.parse(event.x.toStringAsFixed(1)) == -9.8 ||
              double.parse(event.x.toStringAsFixed(1)) == 9.8) {
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

        if (isgamerunning && isplaying) {
          if (event.z > rotationlimit) {
            if (issafe && isForhead) {
              issafe = false;
              isForhead = false;
              badpoint();
            }
          } else if (event.z < -rotationlimit) {
            if (issafe && isForhead) {
              issafe = false;
              isForhead = false;
              goodpoint();
            }
          } else if (event.z.abs() > rotationlimit / 2) {
            issafe = true;
          }
        }
      }));
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    gameconfig = ModalRoute.of(context).settings.arguments;
    Color teamcolor = gameconfig.teams.first.color;
    contentlist = getcontentofcategorie(gameconfig.categories.idcategorie);
    bool _animated = pointPressed;
    return Scaffold(
      backgroundColor: teamcolor.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Visibility(
          visible: _isvisible,
          child: BackButton(),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
          child: Text(
            header,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
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
                  child: AnimatedDefaultTextStyle(
                    textAlign: TextAlign.center,
                    onEnd: () {
                      setState(() {
                        pointPressed = false;
                      });
                    },
                    duration: Duration(
                      milliseconds: _animateDuration,
                    ),
                    style: _animated
                        ? TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                            color: isaPoint ? Colors.green : Colors.red,
                          )
                        : TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
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
