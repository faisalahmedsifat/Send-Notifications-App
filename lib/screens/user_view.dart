import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    return const Placeholder();
  }
}
