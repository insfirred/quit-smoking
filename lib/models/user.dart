//data of the user
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String name = '';
  DateTime startingDate = DateTime.now();
  int numberOfCigPerPack = 0;
  int numberOfCigPerDay = 0;
  double packPrice = 0.0;

  User(){
  }


}
