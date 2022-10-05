import 'package:get/get.dart';

import '../models/user.dart' as u;

//this file will help in storing the data properly while managing the state of the application
class UserController extends GetxController {
  u.User user = u.User();

  void setName(String query) {
    user.name = query;
    update();
  }

  String getName() {
    return user.name;
  }
}
