import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparkle/router/routes.dart';
import 'firebase_options.dart';
import 'utils/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  //dummy 데이터 삽입
  //await loadDataAndInsertToFirebase();

  var dataService = DatabaseService();
  var data = await dataService.readData('users/jay');
  print(data);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  importData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Galmuri11",
      ),
      routerConfig: router,
    );
  }
}
