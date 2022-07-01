import 'package:shared_preferences/shared_preferences.dart';

class getid {
  Future<String> get()
  async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    return  prefs.getString("id");

  }
}