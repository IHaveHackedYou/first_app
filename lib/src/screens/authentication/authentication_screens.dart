import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/src/consts/enums.dart';
import 'package:first_app/src/screens/authentication/authentication_input_forms.dart';
import 'package:first_app/src/screens/authentication/loggedout_screen.dart';
import 'package:first_app/src/screens/home_screen.dart';
import 'package:first_app/src/screens/todo_list/add_todo.dart';
import 'package:first_app/src/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'widgets.dart';

class Authentication extends StatelessWidget {
  const Authentication({
    // current login state
    required this.loginState,
    required this.email,
    required this.startSignUpFlow,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
    required this.startSignInFlow,
    required this.getUser,
    required this.startAddingTask,
    required this.backToMainPage,
  });

  final ApplicationLoginState loginState;
  final String? email;
  final void Function() startSignUpFlow;
  final void Function() startSignInFlow;
  final void Function(
          String email, String password, void Function(Exception e) error)
      signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(String email, String displayName, String password,
      void Function(Exception e) error) registerAccount;
  final void Function() signOut;
  final User? Function() getUser;
  final void Function() startAddingTask;
  final void Function() backToMainPage;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return LoggedOutScreen(startSignInFlow: startSignInFlow, startSignUpFlow: startSignUpFlow,); 


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

      case ApplicationLoginState.loggedInMainPage:
        return MultiProvider(
          providers: [ChangeNotifierProvider.value(value: Database())],
          child: HomeScreen(
            signOut: signOut,
            getUser: getUser,
            startAddingTask: startAddingTask,
          ),
        );

      case ApplicationLoginState.addTask:
        return MultiProvider(
            providers: [ChangeNotifierProvider.value(value: Database())],
            child: AddTodo(
              getUser: getUser,
              backToMainPage: backToMainPage,
            ));

      default:
        return Scaffold(
          body: Row(
            children: const [
              Text("Internal error, this shouldn't happen..."),
            ],
          ),
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
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
