import 'package:flutter/material.dart';

class CustomAppBars{
  static AppBar mainAppBar(BuildContext context) => AppBar(
    title: Text("Tasks"),
    centerTitle: true,
    elevation: 0,
  );
}