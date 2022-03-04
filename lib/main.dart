import 'package:first_app/src/consts/material_themes.dart';
import 'package:first_app/src/services/authentication.dart';
import 'package:first_app/src/screens/homepage.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      // listen to ApplicationState
      create: (context) => ApplicationState(),
      builder: (context, _) => MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Fancy app", home: HomePage() , theme: darkTheme());
  }
}


