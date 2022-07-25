
import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper{

static late SharedPreferences sharedPreferences;

static init()async
{
  sharedPreferences =await SharedPreferences.getInstance();
}




static Future<bool> setBoolean({
  required String key,
  required bool value,
})async
{
  return await sharedPreferences.setBool(key, value);
}

static dynamic getBoolean({required String key,})
{
  return  sharedPreferences.getBool(key);
}

static dynamic getString({required String key,})
{
  return  sharedPreferences.getString(key);
}

/// USED FOR ALL DATATYPES

static Future<bool> setData({
  required String key,
  required dynamic value,
})async
{

 if(value is String )
   {
     return await sharedPreferences.setString(key, value);
   }
  if(value is bool )
 {
   return await sharedPreferences.setBool(key, value);
 }
  if(value is int )
 {
   return await sharedPreferences.setInt(key, value);
 }
 return await sharedPreferences.setDouble(key, value);

}

/// USED FOR ALL DATATYPES

static dynamic getData({
  required String key,
})async
{
  return await sharedPreferences.get(key);
}

static Future<bool> removeData({required String key})async
{
 return await sharedPreferences.remove(key);
}


}
