
import 'package:flutter/material.dart';
import 'package:riddle_me/models/team.dart';
import 'package:riddle_me/appConfiguration.dart';

class AddPlayers extends StatefulWidget {
  @override
  _AddPlayersState createState() => _AddPlayersState();
}

class _AddPlayersState extends State<AddPlayers> {

  List<Team> team = new List();
  Config _config = new Config();

  void agregarEquipo(){
    if(team.length < 5){
      if(team.length == 2){
        team.add(
        new Team(idteam: 3, nombre: 'Equipo verde', color: Colors.green),
      );
      } else
      if(team.length == 3){
        team.add(
        new Team(idteam: 4, nombre: 'Equipo amarillo', color: Colors.yellow),
      );
      } else
      if(team.length == 4){
        team.add(
        new Team(idteam: 5, nombre: 'Equipo rosa', color: Colors.pink),
      );
      } 
    }
  }

   void removerEquipo(){
     if(team.length > 2){
        team.removeLast();
     }
  }

  @override
  Widget build(BuildContext context) {
    _config.setAllConfig();
    team = team.isNotEmpty ? team : ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.grey[700],
          onPressed: (){
            Navigator.pop(context, team);
          },
        ),
        title: Text(
          'Agregar equipos',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
        child: Row(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  removerEquipo();
                });
              },
              heroTag: 'lessbutton',
              child: Icon(Icons.remove),
            ),
            Flexible(
                child: Container(
                child: GridView.count(
                        crossAxisCount: 4,
                        children: List.generate(team.length, (index) {
                            return Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: team[index].color,
                              ),
                              child: Center(
                                child: Container(
                                  width: 70.0,
                                  child: Text(
                                    team[index].nombre,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            );
                         }).toList()),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  agregarEquipo();
                });
              },
              heroTag: 'plussbutton',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      // Container(
      //   padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
      //   child: Row(
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
      //         child: Container(
      //           width: 60.0,
      //           height: 60.0,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: Colors.red,
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
      //             child: Text(
      //               'Equipo rojo',
      //               style: TextStyle(
      //                 color: Colors.black,
      //                 fontSize: 16.0,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ), 
      //         ),
      //       ),
      //       Container(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.lightBlue,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}