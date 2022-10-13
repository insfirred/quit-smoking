import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
class NameChange extends ChangeNotifier {

TextEditingController nameofuser = TextEditingController();


String _name = '';
String get username => _name;

void updateName(String name){
  _name = name;
  notifyListeners();
}
}