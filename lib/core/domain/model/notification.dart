import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notice.dart';

class Notification {
  Notice notice;
  DateTime date;
  Time time;

  Notification({required this.notice, required this.date, required this.time});

  Notification copyWith({
    Notice? notice,
    DateTime? date,
    Time? time,
  }) =>
      Notification(
        notice: notice ?? this.notice,
        date: date ?? this.date,
        time: time ?? this.time,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Notification &&
        other.notice == notice &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode => notice.hashCode ^ date.hashCode ^ time.hashCode;
}
