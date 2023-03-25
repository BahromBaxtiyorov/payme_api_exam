import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:payme_api/pages/mainView.dart';
import 'package:hive_flutter/adapters.dart';
import 'getStorage.dart';
import 'models/user_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  box = await Hive.openBox('Homepage');
  // user = await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}


