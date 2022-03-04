import 'package:first_app/src/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/authentication_screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Servus leude"),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: SafeArea(
            child: Container(
                child: Column(
          children: [
            Consumer<ApplicationState>(
                builder: (context, appState, _) => Authentication(
                      email: appState.email,
                      loginState: appState.loginState,
                      startSignInFlow: appState.startSignInFlow,
                      startSignUpFlow: appState.startSignUpFlow,
                      verifyEmail: appState.verifyEmail,
                      signInWithEmailAndPassword:
                          appState.signInWithEmailAndPassword,
                      cancelRegistration: appState.cancelRegistration,
                      registerAccount: appState.registerAccount,
                      signOut: appState.signOut,
                    )),
          ],
        ))));
  }
}