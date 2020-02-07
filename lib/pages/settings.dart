import 'package:flutter/material.dart';
import 'package:riddle_me/appConfiguration.dart';
import 'package:riddle_me/models/configuration.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Map data = {};
  Config _config = new Config();
  Configuration _setting = new Configuration();

  @override
  Widget build(BuildContext context) {
    _config.setAllConfig();
    _setting = _setting == null ? _setting : ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.grey[700],
          onPressed: () {
             Navigator.pop(context, _setting);
          },
        ),
        title: Text(
          'Ajustes',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: 
      SingleChildScrollView(
              child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: ListTile(
                    title: Text(
                      'Duración de ronda',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 24.0,
                      ),
                    ),
                    trailing: Container(
                      width: 150.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                            child: Container(
                              width: 30.0,
                              child: FloatingActionButton(
                                heroTag: 'btnPlus',
                                onPressed: () {
                                  setState(() {
                                    if (_setting.roundtime > 60) {
                                      _setting.roundtime -= 60;
                                    }
                                  });
                                },
                                backgroundColor: Colors.grey[350],
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Text(
                            '${_setting.roundtime}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                            child: Container(
                              width: 30.0,
                              child: FloatingActionButton(
                                heroTag: 'btnLess',
                                onPressed: () {
                                  setState(() {
                                    if (_setting.roundtime < 300) {
                                      _setting.roundtime += 60;
                                    }
                                  });
                                },
                                backgroundColor: Colors.grey[350],
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   child: Text('${_setting.roundtime}'),
                  //   ),
                ),
                Divider(color: Colors.grey[700], height: 20.0, indent: 10.0, endIndent: 60.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 25.0, 0),
                  child: Center(
                    child: SwitchListTile(
                      title: Text(
                        'Sonido',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 24.0,
                        ),
                      ),
                      value: _setting.sound,
                      onChanged: (bool value) {
                        setState(() {
                          _setting.sound = value;
                        });
                      },
                    ),
                  ),
                ),
                Divider(color: Colors.grey[700], height: 20.0, indent: 10.0, endIndent: 60.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 25.0, 0),
                  child: Center(
                    child: SwitchListTile(
                      title: Text(
                        'Vibración',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 24.0,
                        ),
                      ),
                      value: _setting.vibration,
                      onChanged: (bool value) {
                        setState(() {
                          _setting.vibration = value;
                        });
                      },
                    ),
                  ),
                ),
                Divider(color: Colors.grey[700], height: 20.0, indent: 10.0, endIndent: 60.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 25.0, 0),
                  child: Center(
                    child: ListTile(
                      title: Text(
                        'Idioma',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 24.0,
                        ),
                      ),
                      trailing: Container(
                        child: DropdownButton(
                          value: _setting.language,
                          onChanged: (String newValue) {
                            setState(() {
                              _setting.language = newValue;
                              print(_setting.language);
                            });
                          },
                          //icon: Icon(Icons.arrow_drop_down),
                          items: <String>['Español','English', 'Portugues', 'Frances']
                          .map<DropdownMenuItem<String>>((String newValue) {
                            return DropdownMenuItem<String>(
                              value: newValue,
                              child: Text(newValue),
                            );
                          }).toList(),
                        ),
                        // Text(
                        //   '${_setting.language}',
                        //   style: TextStyle(
                        //     fontSize: 20.0,
                        //     color: Colors.grey[700],
                        //   ),
                        //   ),
                      ),
                      onTap: () {print('cambio de idioma');},
                    ),
                  ),
                ),
                Divider(color: Colors.grey[700], height: 20.0, indent: 10.0, endIndent: 60.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 25.0, 0),
                  child: Center(
                    child: ListTile(
                      title: Text(
                        'Controlador',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 24.0,
                        ),
                      ),
                      trailing: Container(
                        child: 
                        DropdownButton(
                          value: _setting.gamemode,
                          onChanged: (String otherValue) {
                            setState(() {
                              _setting.gamemode = otherValue;
                              print(_setting.gamemode);
                            });
                          },
                          //icon: Icon(Icons.arrow_drop_down_circle),
                          items: <String>['Inclinación','Táctil', 'Táctil e inclinación']
                          .map<DropdownMenuItem<String>>((String otherValue) {
                            return DropdownMenuItem<String>(
                              value: otherValue,
                              child: Text(otherValue),
                            );
                          }).toList(),
                        ),
                      ),
                      onTap: () {print('cambio de modo de juego');},
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
