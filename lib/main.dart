import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lyricly/controllers/songs_controller.dart';
import 'package:lyricly/screens/home.dart';

void main() {
  // Initialize the hive database
  Hive.init('lyricly');
  SongsController().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homepage());
  }
}
