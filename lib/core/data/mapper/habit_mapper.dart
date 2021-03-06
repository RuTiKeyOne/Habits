import '../../domain/model/habit.dart';
import '../../domain/model/notice.dart';
import '../../domain/model/notification.dart';
import '../model/habit_model.dart';
import '../model/notice_model.dart';
import '../model/notification_model.dart';

class HabitMapper {
  static Habit toHabit(HabitModel model) {
    return Habit(
      id: model.id,
      countSelectedDays: model.countSelectedDays,
      notifications: model.notifications != null
          ? model.notifications!
              .map((e) => Notification(
                    notice: Notice(
                      id: e.notice.id,
                      title: e.notice.title,
                      body: e.notice.body,
                    ),
                    date: e.date,
                    time: e.time,
                  ))
              .toList()
          : null,
      title: model.title,
      selectedColorValue: model.selectedColorValue,
      unselectedColorValue: model.selectedColorValue,
      timesAWeek: model.timesAWeek,
      days: model.daysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
      selectedDays: model.selectedDaysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
      completedDays: model.completedDaysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
      totalDays: model.totalDaysMilliSeconds
          .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
          .toList(),
    );
  }

  static HabitModel toHabitModel(Habit habit) {
    return HabitModel(
      id: habit.id,
      title: habit.title,
      countSelectedDays: habit.countSelectedDays,
      notifications: habit.notifications != null
          ? habit.notifications!
              .map(
                (e) => NotificationModel(
                  notice: NoticeModel(
                      id: e.notice.id,
                      title: e.notice.title,
                      body: e.notice.body),
                  date: e.date,
                  time: e.time,
                ),
              )
              .toList()
          : null,
      timesAWeek: habit.timesAWeek,
      unselectedColorValue: habit.unselectedColorValue,
      selectedColorValue: habit.selectedColorValue,
      daysMilliSeconds:
          habit.days.map((e) => e.millisecondsSinceEpoch).toList(),
      selectedDaysMilliSeconds:
          habit.selectedDays.map((e) => e.millisecondsSinceEpoch).toList(),
      completedDaysMilliSeconds:
          habit.completedDays.map((e) => e.millisecondsSinceEpoch).toList(),
      totalDaysMilliSeconds:
          habit.totalDays.map((e) => e.millisecondsSinceEpoch).toList(),
    );
  }

  static List<Habit> toListHabit(List<HabitModel> list) {
    return list
        .map(
          (model) => Habit(
            id: model.id,
            notifications: model.notifications != null
                ? model.notifications!
                    .map(
                      (e) => Notification(
                        notice: Notice(
                          id: e.notice.id,
                          title: e.notice.title,
                          body: e.notice.body,
                        ),
                        date: e.date,
                        time: e.time,
                      ),
                    )
                    .toList()
                : null,
            title: model.title,
            countSelectedDays: model.countSelectedDays,
            unselectedColorValue: model.unselectedColorValue,
            selectedColorValue: model.selectedColorValue,
            timesAWeek: model.timesAWeek,
            days: model.daysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
            selectedDays: model.selectedDaysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
            completedDays: model.completedDaysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
            totalDays: model.totalDaysMilliSeconds
                .map((e) => DateTime.fromMillisecondsSinceEpoch(e))
                .toList(),
          ),
        )
        .toList();
  }
}
