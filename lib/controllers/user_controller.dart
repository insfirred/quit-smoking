import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

//this file will help in storing the data properly while managing the state of the application
class UserController extends GetxController {
  late User user ;
  late SharedPreferences sharedPreferences;
  static const String _nameParam='name';
  static const String _dateParam='date';
  static const String _priceParam='price';
  static const String _countParam='count';
  static const String _packParam='pack';
  UserController(){
    user=User();
    init_user();
  }
  void init_user()async {
    sharedPreferences=await SharedPreferences.getInstance();
    bool? onBoard=sharedPreferences.getBool('isOnboarded');
    if (onBoard== null || !onBoard) {
      return;
    } else {
      user.name=sharedPreferences.getString(_nameParam)??"";
      user.startingDate=DateTime.parse(sharedPreferences.getString(_dateParam)??DateTime.now().toIso8601String());
      user.numberOfCigPerDay=sharedPreferences.getInt(_countParam)??0;
      user.numberOfCigPerPack=sharedPreferences.getInt(_packParam)??0;
      user.packPrice=sharedPreferences.getDouble(_priceParam)??0;
      update();
    }
  }
  void setName(String query) {
    user.name = query;
    sharedPreferences.setString(_nameParam, query);
    update();
  }

  void setDate(DateTime dateTime) {
    user.startingDate = dateTime;

    sharedPreferences.setString(_dateParam, dateTime.toIso8601String());
    update();
  }

  void setNumberOfCigPerPack(int val) {
    user.numberOfCigPerPack = val;

    sharedPreferences.setInt(_packParam, val);
    update();
  }

  void setNumberOfCigPerDay(int val) {
    user.numberOfCigPerDay = val;
    sharedPreferences.setInt(_countParam, val);
    update();
  }

  void setPricePack(double val) {
    user.packPrice = val;
    sharedPreferences.setDouble(_priceParam, val);
    update();
  }

  String getName() {
    return user.name;
  }

  DateTime getStartingDate() {
    return user.startingDate;
  }

  int getNumberofCigPerPack() {
    return user.numberOfCigPerPack;
  }

  int getNumberOfCigPerDay() {
    return user.numberOfCigPerDay;
  }

  double getPackPrice() {
    return user.packPrice;
  }
}
