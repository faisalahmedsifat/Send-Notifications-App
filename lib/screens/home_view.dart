import 'package:flutter/material.dart';
import 'package:send_notification/api/firebase_messaging_service.dart';
import 'package:send_notification/screens/admin_view.dart';
import 'package:send_notification/screens/user_view.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key, required this.email});

  final String email;

  final _messaging = FirebaseMessagingService();

  

  @override
  Widget build(BuildContext context) {
    if(email != 'admin@admin.com'){
        _messaging.initNotifications(email: email);
    }
    return Scaffold(
      body: email == 'admin@admin.com'
          ? const AdminView()
          : UserView(email: email),
    );
  }
}
