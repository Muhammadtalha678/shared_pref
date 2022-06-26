import 'package:flutter/material.dart';
import 'package:shared_pref/screens/home.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('email');
      var password = prefs.getString('password');
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: email == null && password == null ? Login() :Home()));
    }
    


