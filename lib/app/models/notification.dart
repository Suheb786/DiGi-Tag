import 'dart:html';

class NotificationModel {
  final DateTime time;
  final int version;
  final String title;
  final String body;
  final String type;
  final List<String> imageUrls;
  final String sendBy;
  NotificationModel({
    required this.time,
    required this.version,
    required this.title,
    required this.body,
    required this.type,
    required this.imageUrls,
    required this.sendBy,
  });

  NotificationModel copyWith({
    DateTime? time,
    int? version,
    String? title,
    String? body,
    String? type,
    List<String>? imageUrls,
    String? sendBy,
  }) {
    return NotificationModel(
      time: time ?? this.time,
      version: version ?? this.version,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      imageUrls: imageUrls ?? this.imageUrls,
      sendBy: sendBy ?? this.sendBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time':time,
      'version': version,
      'title': title,
      'body': body,
      'type': type,
      'imageUrls': imageUrls,
      'sendBy': sendBy,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      time: map['time'] as DateTime,
        sendBy: map['sendBy'] as String,
        version: map['version'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
        type: map['type'] as String,
        imageUrls: List<String>.from(
          (map['imageUrls'] as List<String>),
        ));
  }
}
