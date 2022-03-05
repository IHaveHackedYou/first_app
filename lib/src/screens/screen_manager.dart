import 'package:first_app/src/consts/custom_app_bar.dart';
import 'package:first_app/src/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/authentication_screens.dart';

class ScreenManager extends StatelessWidget {
  const ScreenManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationState>(
        builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startSignInFlow: appState.startSignInFlow,
              startSignUpFlow: appState.startSignUpFlow,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
              getUser: appState.getUser,
            ));
  }
}
