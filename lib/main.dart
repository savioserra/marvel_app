import 'package:flutter/material.dart';
import 'package:marvel_app/presentation/splash.page.dart';

void main() => runApp(MarvelApp());

class MarvelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel App',
      home: SplashPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Gilroy",
      ),
    );
  }
}
