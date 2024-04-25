import 'package:flutter/material.dart';
import 'package:send_notification/components/email_field.dart';
import 'package:send_notification/components/password_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Register'),
    Tab(text: 'Login'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Container(
              height: 400,
              child: Column(
                children: [
                  // const Text('Register'),
                  const EmailField(),
                  const PasswordField(title: 'Password'),
                  const PasswordField(title: 'Confirm Password'),
                  ElevatedButton(
                    onPressed: () {},
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
                  const EmailField(),
                  const PasswordField(title: 'Password'),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
