import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/src/consts/enums.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends ChangeNotifier {
  AuthenticationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    // checks current user status
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedInMainPage;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  // current login state of user
  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  void startSignUpFlow() {
    _loginState = ApplicationLoginState.signUp;
    print("change to sign up");
    notifyListeners();
  }

  void startSignInFlow() {
    _loginState = ApplicationLoginState.signIn;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  User? getUser(){
    return FirebaseAuth.instance.currentUser;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
