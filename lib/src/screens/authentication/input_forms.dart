import "package:flutter/material.dart";



class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.registerAccount,
    required this.cancel,
    required this.email,
  });

  final String email;
  final void Function(String email, String displayName, String password)
      registerAccount;
  final void Function() cancel;

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Create account'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      hintText: 'First & last name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your account name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: widget.cancel,
                        child: const Text('CANCEL'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.registerAccount(
                              _emailController.text,
                              _displayNameController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text('SAVE'),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    required this.login,
    required this.email,
  });

  final String email;
  final void Function(String email, String password) login;

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Sign in'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text('SIGN IN'),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm(
      {Key? key,
      required this.signUp,
      required this.cancel,
      required this.changeToSignIn})
      : super(key: key);

  final void Function(String email, String displayName, String password)
      signUp;
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

  InputDecoration inputDecoration(IconData icon, String labelText) =>
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.tertiary, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(children: [
        Text("Create Account"),
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
                  decoration: inputDecoration(Icons.email, "Email"),
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
                  decoration: inputDecoration(Icons.vpn_key, "Password"),
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
                  decoration: inputDecoration(Icons.person, "Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    // TODO add sign in behavior
                    GestureDetector(
                        child: Text("Sign in instead",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
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

  InputDecoration inputDecoration(IconData icon, String labelText) =>
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

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.tertiary, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(children: [
          Text("Create Account"),
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
                    decoration: inputDecoration(Icons.email, "Email"),
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
                    decoration: inputDecoration(Icons.vpn_key, "Password"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          child: Text("Sign up instead",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
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
        ]));
  }
}
