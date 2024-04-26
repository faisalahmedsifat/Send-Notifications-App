import 'package:flutter/material.dart';
import 'package:send_notification/api/firebase_admin_service.dart';
import 'package:send_notification/api/firebase_auth_service.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Admin View'),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Message',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement send notification logic
            String message = _controller.text;
            FirebaseAdminService()
                .sendNotificationsToFCMTopic('For the Junior Dev role.!!', message);
          },
          child: Text('Send Notification'),
        ),
        TextButton(
            onPressed: () async {
              await FirebaseAuthService().signOut();
            },
            child: Text('Sign Out')),
      ],
    );
  }
}
