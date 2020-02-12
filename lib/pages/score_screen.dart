import 'package:flutter/material.dart';
import 'package:riddle_me/appConfiguration.dart';
import 'package:riddle_me/models/points.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  Config _config = new Config();
  List<Points> points = [];
  String earnedpoints = '0';

  void returnhome() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Terminar juego ?'),
            content: Text('Seguro que desea cancelar y salir de la partida ?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {
                  returnhome();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _config.setAllConfig();
    points = ModalRoute.of(context).settings.arguments;
    earnedpoints = (points.where((t) => t.isValid == true).length).toString();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.grey[600],
            ),
            onPressed: () {
              _showDialog();
            }),
        title: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50.0, 0, 0, 0),
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.greenAccent[300],
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Puntuación: ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      earnedpoints,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              alignment: Alignment.centerRight,
              icon: Icon(
                Icons.insert_chart,
                color: Colors.grey[700],
              ),
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120.0, 0, 5.0, 0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    itemCount: points.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Center(
                          child: Text(points[index].words,
                              style: TextStyle(
                                color:
                                    points[index].isValid ? Colors.green : Colors.red,
                                fontSize: 20.0,
                              )),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 120.0, 10.0, 10.0),
                  child: Container(
                    width: 100.0,
                    child: Column(
                      children: <Widget>[
                        FloatingActionButton(
                          elevation: 2.0,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            ),
                          onPressed: (){}
                          ),
                          Center(
                            child: Text(
                              'Siguiente equipo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                              ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
