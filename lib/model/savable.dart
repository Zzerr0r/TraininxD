import 'package:shared_preferences/shared_preferences.dart';

abstract class Savable{
  String saveString;
  String saveValue;


  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(saveString, saveValue);
  }

  static Future<String> read(String saveString) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(saveString);
  }


}
