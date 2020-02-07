// import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flame/util.dart';

class Config {

  void setAllConfig() {
    setLandscape();
    hideBar();
  }

  Util frameutil = new Util();

  void setLandscape() async {
      
      await frameutil.setLandscape();

  }

  void hideBar() async{
    await frameutil.fullScreen();
  }
}
