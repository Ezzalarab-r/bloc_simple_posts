import 'package:shared_preferences/shared_preferences.dart';

import '../app/app_constants.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(languageCodeKey, languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(languageCodeKey) ?? 'en';
  }
}
