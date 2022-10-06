import 'package:get/get.dart';

import '../models/user.dart';

//this file will help in storing the data properly while managing the state of the application
class UserController extends GetxController {
  User user = User();

  void setName(String query) {
    user.name = query;
    update();
  }

  void setDate(DateTime dateTime) {
    user.startingDate = dateTime;
    update();
  }

  void setNumberOfCigPerPack(int val) {
    user.numberOfCigPerPack = val;
    update();
  }

  void setNumberOfCigPerDay(int val) {
    user.numberOfCigPerDay = val;
    update();
  }

  void setPricePack(double val) {
    user.packPrice = val;
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
