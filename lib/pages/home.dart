import 'package:flutter/material.dart';
import 'package:riddle_me/appConfiguration.dart';
import 'package:riddle_me/models/categories.dart';
import 'package:riddle_me/models/gogame.dart';
import 'package:riddle_me/models/team.dart';
import 'package:riddle_me/models/configuration.dart';

List<Team> teams = [
  Team(
        idteam: 1,
        nombre: 'Equipo rojo',
        color: Colors.red,
        ),
        Team(
        idteam: 2,
        nombre: 'Equipo azul',
        color: Colors.blue,
        ),
        ];

Configuration _setting = new Configuration(
      roundtime: 60,
      gamemode: 'Inclinación',
      sound: true,
      vibration: true,
      language: 'Español');

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categories> categorias = [
    Categories(
      idcategorie: 1,
        nombre: 'Niños',
        descripcion:
            'Juega con palabras de muñecos animados y contenido para los pequeños',
        urlLogo: 'kids.png',
        estaActiva: true),
    Categories(
        idcategorie: 2,
        nombre: 'Profesiones',
        descripcion: 'Juega con palabras de profesiones',
        urlLogo: 'jobs.png',
        estaActiva: true),
    Categories(
        idcategorie: 3,
        nombre: 'Acciones',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'actions.png',
        estaActiva: true),
    Categories(
        idcategorie: 4,
        nombre: 'Deportes',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
    Categories(
        idcategorie: 5,
        nombre: 'Música',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
    Categories(
        idcategorie: 6,
        nombre: 'Celebridades',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
    Categories(
        idcategorie: 7,
        nombre: 'Expresiones y acentos',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
    Categories(
        idcategorie: 8,
        nombre: 'Geografia',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
    Categories(
        idcategorie: 9,
        nombre: 'Juegos',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
    Categories(
        idcategorie: 10,
        nombre: 'Literatura',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
    Categories(
        idcategorie: 11,
        nombre: 'Marcas',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
        Categories(
            idcategorie: 12,
        nombre: 'Peliculas',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
        Categories(
            idcategorie: 13,
        nombre: 'Superheroes',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
        Categories(
            idcategorie: 14,
        nombre: 'Muñecos animados',
        descripcion:
            'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
        urlLogo: 'sports.png',
        estaActiva: true),
  ];
  Config _config = new Config();

  void navigateToGame(index) {
    Gogame gogame = Gogame(
      teams: teams,
      setting: _setting,
      categories: new Categories(idcategorie: categorias[index].idcategorie, nombre: categorias[index].nombre,
      descripcion: categorias[index].descripcion, urlLogo: categorias[index].urlLogo,
      estaActiva: categorias[index].estaActiva),
      );

    Navigator.pushNamed(context, '/playgame', arguments: gogame);
  }

  void navigateToSettings() async{
   dynamic resulsetting = await Navigator.pushNamed(context, '/setting', arguments: _setting);
   _setting = resulsetting;
  }

   void navigateToAddPlayers() async{
    dynamic resulteam = await Navigator.pushNamed(context, '/addplayer', arguments: teams);
    teams = resulteam;
  }

@override
void initState() {
    //Take all the screen and set landscape
    _config.setAllConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //teams = teams.isNotEmpty ? teams : ModalRoute.of(context).settings.arguments;
    print('Corrio!');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Selecciona una categoria',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          iconSize: 35.0,
          color: Colors.grey[850],
          onPressed: () {
            print('presionado!!!');
            navigateToAddPlayers();
            },
          icon: Icon(Icons.group_add),
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 30.0,
            color: Colors.grey[850],
            onPressed: () {
              navigateToSettings();
              print('presionado!!!');
              },
            icon: Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(categorias.length, (index) {
                return InkWell(
                  onTap: () {
                    navigateToGame(index);
                    print('presionado!!!');
                    },
                    child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blueAccent[400],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent[100],
                          offset: Offset(5.0, 10.0),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: GridTile(
                        header: Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/${categorias[index].urlLogo}'),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0),
                            child: Text(
                              categorias[index].nombre,
                              style: TextStyle(
                                color: Colors.grey[950],
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList())),
    );
  }
}
