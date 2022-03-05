import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authenticationInputFormDecoration(
          IconData icon, String labelText, BuildContext context) =>
      InputDecoration(
        prefixIcon: Icon(icon),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        labelText: labelText,
        filled: true,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      );
}
