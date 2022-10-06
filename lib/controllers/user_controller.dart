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
    print(user.startingDate);
    update();
  }

  String getName() {
    return user.name;
  }

  DateTime getStartingDate() {
    return user.startingDate;
  }
}
