import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class count1 extends ChangeNotifier{
  var value=0;
  int get count => value;

  incre(){
    value++;
    notifyListeners();
  }
  decre(){
    value--;
    notifyListeners();
  }
  reset(){
    value=0;
    notifyListeners();
  }

}
class sabbir01 extends ChangeNotifier{
  var v = '';

  String get c =>v;
 chang(String para) {
  v=para;
  notifyListeners();
 }
}

