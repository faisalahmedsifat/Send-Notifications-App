import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:send_notification/api/firebase_auth_service.dart';
import 'package:send_notification/screens/home_view.dart';
import 'package:send_notification/utils/validator.dart';
import 'package:send_notification/widgets/email_field.dart';
import 'package:send_notification/widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Register'),
    Tab(text: 'Login'),
  ];

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _loginEmail = '';

  String _loginPassword = '';

  String _registerEmail = '';

  String _registerPassword = '';

  String _registerConfirmPassword = '';

  final _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: LoginPage.myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: LoginPage.myTabs,
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Container(
                height: 400,
                child: Column(
                  children: [
                    EmailField(
                      onChanged: (String value) {
                        _registerEmail = value;
                      },
                    ),
                    PasswordField(
                      title: 'Password',
                      onChanged: (String value) {
                        _registerPassword = value;
                      },
                    ),
                    PasswordField(
                      title: 'Confirm Password',
                      onChanged: (String value) {
                        _registerConfirmPassword = value;
                        // print('Confirm Password: $_registerConfirmPassword');
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => _handleUserRegistration(
                          email: _registerEmail,
                          password: _registerPassword,
                          confirmPassword: _registerConfirmPassword),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 400,
                child: Column(
                  children: [
                    EmailField(
                      onChanged: (String value) {
                        _loginEmail = value;
                      },
                    ),
                    PasswordField(
                      title: 'Password',
                      onChanged: (String value) {
                        _loginPassword = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => _handleUserLogin(
                          email: _loginEmail, password: _loginPassword),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleUserLogin({String? email, String? password}) async {
    if (email == '' || password == '') {
      print('Please fill in all fields');
      return;
    }

    if (Validator.isEmailValid(email!) &&
        Validator.isPasswordValid(password!)) {
      User? user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        print('Logged in successful');
        print('user: $user');

        // navigate to home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView(email: user.email!)),
        );
      } else {
        print('Invalid credentials.');
      }
    }
  }

  _handleUserRegistration(
      {String? email, String? password, String? confirmPassword}) async {
    if (email == '' || password == '' || confirmPassword == '') {
      print('Please fill in all fields');

      return;
    }

    try {
      if (Validator.isEmailValid(email!) &&
          Validator.passwordsMatch(password!, confirmPassword!)) {
        if (!Validator.isPasswordValid(password)) {
          print('Password must be 6 characters long.');
          return;
        }
        // print('Email is valid');
        User? user = await _auth.signUpWithEmailAndPassword(
            email: email, password: password);

        if (user != null) {
          print('User registered successfully');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeView(email: user.email!)),
          );
        } else {
          print('User registration failed');
        }
      } else {
        print('Check email and password again!');
      }
    } catch (e) {
      print('ERROR: error while signing up!');
    }
  }
}
