import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static SharedPreferences? sharedPreferences ;

  static void init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData ({
  required final String key ,
  required final bool value ,
   }) async
  {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getData ({
    required final String key ,
  })
  {
    return sharedPreferences!.getBool(key);
  }


}