// import 'package:first_app/src/consts/enums.dart';
// import 'package:flutter/material.dart';
//
// class Authentication extends StatelessWidget {
//   const Authentication({
//     required this.loginState,
//     required this.email,
//     required this.startLoginFlow,
//     required this.verifyEmail,
//     required this.signInWithEmailAndPassword,
//     required this.cancelRegistration,
//     required this.registerAccount,
//     required this.signOut,
//   });
//
//   final ApplicationLoginState loginState;
//   final String? email;
//   final void Function() startLoginFlow;
//   final void Function(
//     String email,
//     void Function(Exception e) error,
//   ) verifyEmail;
//   final void Function(
//     String email,
//     String password,
//     void Function(Exception e) error,
//   ) signInWithEmailAndPassword;
//   final void Function() cancelRegistration;
//   final void Function(
//     String email,
//     String displayName,
//     String password,
//     void Function(Exception e) error,
//   ) registerAccount;
//   final void Function() signOut;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text("Servus");
//   }
// }

import 'package:first_app/src/consts/enums.dart';
import 'package:first_app/src/screens/authentication/input_forms.dart';
import 'package:flutter/material.dart';

// import 'widgets.dart';

class Authentication extends StatelessWidget {
  const Authentication({
    // current login state
    required this.loginState,
    required this.email,
    required this.startSignUpFlow,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
    required this.startSignInFlow,
  });

  final ApplicationLoginState loginState;
  final String? email;
  final void Function() startSignUpFlow;
  final void Function() startSignInFlow;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;
  final void Function(
          String email, String password, void Function(Exception e) error)
      signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(String email, String displayName, String password,
      void Function(Exception e) error) registerAccount;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return Container(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  startSignUpFlow();
                },
                child: const Text("SignUp"),
              ),
              ElevatedButton(
                onPressed: () {
                  startSignInFlow();
                },
                child: const Text("SignIn"),
              ),
            ],
          ),
        );

      case ApplicationLoginState.signUp:
        return SignUpForm(
            signUp: (
              email,
              displayName,
              password,
            ) {
              registerAccount(
                  email,
                  displayName,
                  password,
                  (e) =>
                      _showErrorDialog(context, 'Failed to create account', e));
            },
            changeToSignIn: () => startSignInFlow(),
            cancel: () {
              cancelRegistration();
            });

      case ApplicationLoginState.signIn:
        return SignInForm(
          signIn: (email, password) {
            signInWithEmailAndPassword(email, password,
                (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
          changeToSignUp: () => startSignUpFlow(),
          cancel: () {
            cancelRegistration();
          },
        );

      case ApplicationLoginState.password:
        return PasswordForm(
          email: email!,
          login: (email, password) {
            signInWithEmailAndPassword(email, password,
                (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
        );

      case ApplicationLoginState.register:
        return RegisterForm(
          email: email!,
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (
            email,
            displayName,
            password,
          ) {
            registerAccount(
                email,
                displayName,
                password,
                (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );
        
      case ApplicationLoginState.loggedIn:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: ElevatedButton(
                onPressed: () {
                  signOut();
                },
                child: const Text('LOGOUT'),
              ),
            ),
          ],
        );
      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
