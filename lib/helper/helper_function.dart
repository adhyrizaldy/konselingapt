import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userAccess = "USERACCESS";
  // static String patientLoggedInKey = "PAT_LOGGEDINKEY";
  // static String patientNameKey = "PATIENTNAMEKEY";
  // static String patientEmailKey = "PATIENTEMAILKEY";

  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  // static Future<bool> savePatientLoggedInStatus(bool isUserLoggedIn) async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return await sf.setBool(patientLoggedInKey, isUserLoggedIn);
  // }

  // static Future<bool> savePatientNameSF(String userName) async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return await sf.setString(patientNameKey, userName);
  // }

  // static Future<bool> savePatientEmailSF(String userEmail) async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return await sf.setString(patientEmailKey, userEmail);
  // }

  // // getting the data from SF

  // static Future<bool?> getPatientLoggedInStatus() async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return sf.getBool(patientLoggedInKey);
  // }

  // static Future<String?> getPatientEmailFromSF() async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return sf.getString(patientEmailKey);
  // }

  // static Future<String?> getPatientNameFromSF() async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return sf.getString(patientNameKey);
  // }
}
