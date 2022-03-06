import 'package:flutter/material.dart';

class LoggedOutScreen extends StatefulWidget {
  const LoggedOutScreen(
      {Key? key, required this.startSignUpFlow, required this.startSignInFlow})
      : super(key: key);

  final void Function() startSignUpFlow;
  final void Function() startSignInFlow;

  @override
  State<LoggedOutScreen> createState() => _LoggedOutScreenState();
}

class _LoggedOutScreenState extends State<LoggedOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text("Sign in/up", style: TextStyle(fontSize: 25)),
              )),
          Divider(
            thickness: 2,
          ),
          SizedBox(height: 20),
          Text("create a new account"),
          //* Sign up button
          ElevatedButton(
            onPressed: () {
              widget.startSignUpFlow();
            },
            child: const Text("SignUp"),
          ),
          SizedBox(height: 20),
          Text("already have an account"),
          //* Sign in button
          ElevatedButton(
            onPressed: () {
              widget.startSignInFlow();
            },
            child: const Text("SignIn"),
          )
        ],
      ),
    ));
  }
}

// body: Container(
//             padding: const EdgeInsets.only(left: 24, bottom: 8),
//             child: Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     widget.startSignUpFlow();
//                   },
//                   child: const Text("SignUp"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     widget.startSignInFlow();
//                   },
//                   child: const Text("SignIn"),
//                 ),
//               ],
//             ),
//           )