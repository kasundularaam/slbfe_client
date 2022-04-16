import 'package:shared_preferences/shared_preferences.dart';
import 'package:slbfe_client/data/models/slbfe_user.dart';

class SharedServices {
  static const String userNameKey = "userName";
  static const String userEmailKey = "userEmail";
  static const String isUserInKey = "isUserIn";

  static Future<SlbfeUser> getUser() async {
    bool available = await isUserIn();
    if (available) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      SlbfeUser user = SlbfeUser(
          userName: preferences.getString(userNameKey) ?? "",
          userEmail: preferences.getString(userEmailKey) ?? "");
      return user;
    } else {
      throw "No user available";
    }
  }

  static Future addUser({required SlbfeUser user}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(isUserInKey, true);
    preferences.setString(userEmailKey, user.userEmail);
    preferences.setString(userNameKey, user.userName);
  }

  static Future removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(isUserInKey);
    preferences.remove(userEmailKey);
    preferences.remove(userNameKey);
  }

  static Future<bool> isUserIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool isUserIn = preferences.getBool(isUserInKey) ?? false;
    return isUserIn;
  }
}
