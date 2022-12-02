class SendNotificationModel {
  String? id;
  String? title;
  String? body;
  List<String>? fcmTokens;

  SendNotificationModel({
    this.title,
    this.body,
    this.id,
    this.fcmTokens,
  });

  Map<String, dynamic> toMap() => {
        "registration_ids": fcmTokens,
        "data": {
          "id": id,
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "sound": "default",
        },
        "priority": "high",
        "notification": {
          "title": title,
          "body": body,
        }
      };
}
