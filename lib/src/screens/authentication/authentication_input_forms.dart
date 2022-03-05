import 'package:first_app/src/consts/input_forms.dart';
import "package:flutter/material.dart";

class SignUpForm extends StatefulWidget {
  const SignUpForm(
      {Key? key,
      required this.signUp,
      required this.cancel,
      required this.changeToSignIn})
      : super(key: key);

  final void Function(String email, String displayName, String password) signUp;
  final void Function() cancel;
  final void Function() changeToSignIn;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(children: [
          Text("SignUp"),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email field
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an email-address";
                      } else {
                        return null;
                      }
                    },
                    controller: _emailController,
                    decoration:
                        InputDecorations.authenticationInputFormDecoration(
                            Icons.email, "Email", context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Password field
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      } else {
                        return null;
                      }
                    },
                    controller: _passwordController,
                    obscureText: true,
                    decoration:
                        InputDecorations.authenticationInputFormDecoration(
                            Icons.vpn_key, "Password", context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Name Field
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      } else {
                        return null;
                      }
                    },
                    controller: _displayNameController,
                    decoration:
                        InputDecorations.authenticationInputFormDecoration(
                            Icons.person, "Name", context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          child: Text("Sign in instead"),
                          onTap: widget.changeToSignIn),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.signUp(
                              _emailController.text,
                              _displayNameController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text('SAVE'),
                      ),
                    ],
                  )
                ],
              ))
        ]),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm(
      {Key? key,
      required this.signIn,
      required this.cancel,
      required this.changeToSignUp})
      : super(key: key);

  final void Function(String email, String password) signIn;
  final void Function() cancel;
  final void Function() changeToSignUp;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(children: [
            Text("Sign In"),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an email-address";
                        } else {
                          return null;
                        }
                      },
                      controller: _emailController,
                      decoration:
                          InputDecorations.authenticationInputFormDecoration(
                              Icons.email, "Email", context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Password field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else {
                          return null;
                        }
                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration:
                          InputDecorations.authenticationInputFormDecoration(
                              Icons.vpn_key, "Password", context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: Text(
                              "Sign up instead",
                            ),
                            onTap: widget.changeToSignUp),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.signIn(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    )
                  ],
                ))
          ])),
    );
  }
}
