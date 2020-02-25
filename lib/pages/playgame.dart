import 'package:flutter/material.dart';
import 'package:riddle_me/appConfiguration.dart';
import 'package:riddle_me/models/gogame.dart';

class PlayGame extends StatefulWidget {
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  Gogame gameconfig = new Gogame();
  Config _config = new Config();

  void navigateToRunGame(Gogame gameconfig) {
    Navigator.pushNamed(context, '/runninggame', arguments: gameconfig);
  }

  @override
  void dispose(){
    super.dispose();
  }

   @override
   void initState(){
    _config.setAllConfig();
    super.initState();
   }
 
  @override
  Widget build(BuildContext context) {
    gameconfig = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          onPressed: (){
             Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/${gameconfig.categories.urlLogo}'),)
              )
            ),
              Text(
                gameconfig.categories.nombre,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                child: Text(
                  gameconfig.categories.descripcion,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 10.0),
                child: FlatButton(
                  onPressed: (){
                      navigateToRunGame(gameconfig);
                  }, 
                  textColor: Colors.blue[900],
                  color: Colors.grey[200],
                  child: Text(
                    'Iniciar juego',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                    ),
                  ),
              )
          ],
          ),
        ),
      ),
    );
  }
}