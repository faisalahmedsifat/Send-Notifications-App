import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class FirebaseAdminService {
  void sendNotificationsToFCMTopic(String title, String message) async {
    // send a message to a topic using the Firebase Messaging API
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAAoTErf-U:APA91bEXftuU7CDZZDdZWaEspzChwAvCq-VEZxwB3eY_teFHu3c3WjORL_Y7jsyy_BFJGvkn_WfHYcwXJBj4mkb0--5eH2xFxTKznOeCMbvIGfR3v84RVYMxPkpPb51wVO8YtY5UFfCu'
              },
              body: jsonEncode(
                <String, dynamic>{
                  'notification': <String, dynamic>{
                    'body': message,
                    'title': title
                  },
                  'priority': 'high',
                  'data': data,
                  'to': '/topics/something',
                },
              ));

      if (response.statusCode == 200) {
        print('notification sent');
      } else {
        print('notification not sent');
      }
    } catch (e) {
      print('Some Error Occured');
    }
  }
}
