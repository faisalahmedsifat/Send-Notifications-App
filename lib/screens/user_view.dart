import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:send_notification/api/firebase_auth_service.dart';
import 'package:send_notification/api/firebase_messaging_service.dart';

class UserView extends StatefulWidget {
  const UserView({super.key, required this.email});

  final String email;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    super.initState();
    // FirebaseMessagingService().initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('User View'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                  'Welcome ${widget.email} \nJust close the application and you will recieve notifications when the admins wants.'),
            ),
          ),
          TextButton(
              onPressed: () async {
                await FirebaseAuthService().signOut();
              },
              child: Text('Sign Out')),
        ],
      ),
    );
  }
}
