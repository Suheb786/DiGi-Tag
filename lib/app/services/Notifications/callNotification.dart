import 'dart:convert';
import 'dart:io';

import 'package:digitag/app/modules/screens/MedicalSupport/medialsupport_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<http.Response> sendCallNotification(
    String peerToken, String content) async {
  final body = jsonEncode(
    {
      "to": peerToken,
      "priority": "high",
      "data": {
        "id": "12345",
        "payload": "This is payload",
      },
      "notification": {
        "vibrate": "300",
        "priority": "high",
        "image": "https://picsum.photos/48/48",
        "body": content,
        "title": "Test with the S10 application",
        "sound": "custom.mp3",
        "android_channel_id":
            "pushnotificationapp" /* android's sound is set within the app using notification channels */
      }
    },
  );

  final response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          "key=AAAAJpEcLjY:APA91bHXkx2vrKIxgQVE9og-6huoyv5aIPuwRprDU5dXec5IJEUqCto5r1spNPJjlQbJdwLVmFJmD_2qPeGsGsLZycrQUAUiOEcNHMulFJiMok5HaXrvbFtS8nYg9QzPgt206oiXLc78"
    },
    body: body,
  );
  debugPrint("send notification call");
  // debugPrint("send notifications is ${body.toString()}");
  return response;
}
