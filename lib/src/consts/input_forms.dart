import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authenticationInputFormDecoration(
          IconData icon, String labelText, BuildContext context) =>
      InputDecoration(
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        labelText: labelText,
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      );
}
