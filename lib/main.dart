import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/view/homepage.dart';
import 'package:video_player_app/controller/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderData(),
        child: MaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        ));
  }
}
