import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Varela",
      ),
      home: HomePage(),
    );
  }
}
