import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:http/http.dart' as http;

Future<http.Response> sendCallNotification({
  required String id,
  required String token,
  required String bodyText,
  required String imageUrl,
  required String title,
  required String payLoad,
}) async {
  final body = jsonEncode(
    {
      "to": token,
      "priority": "high",
      "data": {
        "id": id,
        "payload": payLoad,
      },
      "notification": {
        "vibrate": "300",
        "priority": "high",
        "image": imageUrl,
        "body": bodyText,
        "title": title,
        
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
          "key=AAAAaqmsu4Q:APA91bEc4iWtUJyMUKYll9PviP0zJJ0wqQuUZ2jcvBS-lkSLwuy6wERFQ5DPMwdjDQFlm1WrsIWsHJlKkwPAU7mt4NNLVaSCEJFCQSAsWaZVc0iNwjlZfxnwtmASpoB64d4bvqO7Y-oK"
    },
    body: body,
  );
  log("send notification call");
  // debugPrint("send notifications is ${body.toString()}");
  return response;
}
