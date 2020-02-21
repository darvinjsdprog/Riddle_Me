import 'package:riddle_me/models/categories.dart';
import 'package:riddle_me/models/team.dart';
import 'configuration.dart';

class Gogame{
  List<Team> teams;

  Configuration setting;

  Categories categories;

  Gogame({this.teams, this.setting, this.categories});
}