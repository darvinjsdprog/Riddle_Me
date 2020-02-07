import 'package:riddle_me/models/categories.dart';
import 'package:riddle_me/models/team.dart';
import 'package:riddle_me/models/configuration.dart';

class Gogame{
  List<Team> teams;

  Configuration setting;

  Categories categories;

  Gogame({this.teams, this.setting, this.categories});
}