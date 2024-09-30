import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLanguage='en';

  void changeLanguage(String newLanguage)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(newLanguage==currentLanguage)return;
    currentLanguage=newLanguage;
     prefs.setString('language', currentLanguage);

    notifyListeners();
  }
  void getLanguage()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang=prefs.getString('language')??'en';
    currentLanguage=lang;
    notifyListeners();
  }



}