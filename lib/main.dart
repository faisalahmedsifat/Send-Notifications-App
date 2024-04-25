import 'package:flutter/material.dart';

void main() {
  runApp(const SendNotificationsApp());
}

class SendNotificationsApp extends StatelessWidget {
  const SendNotificationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // final String title;

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('This is the Login Page'),
    ));
  }
}
