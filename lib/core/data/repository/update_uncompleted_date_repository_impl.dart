import '../../domain/model/habit.dart';
import '../../domain/model/notification.dart';
import '../../domain/repository/update_date_repository.dart';
import '../../internal/db_di/db_controller.dart';
import '../../internal/locator.dart';

class UpdateUncompletedDateRepositoryImpl extends UpdateDateRepository {
  @override
  Future<void> updateDate(
      {required Habit habit, required DateTime date}) async {
    final _updatedSelectedDays = habit.selectedDays;
    _updatedSelectedDays.add(date);
    final _updatedCompletedDays = habit.completedDays;
    _updatedCompletedDays.remove(date);
    final _updatedNotifications = habit.notifications;

    if (_updatedNotifications != null) {
      if (_updatedNotifications.isNotEmpty) {
        _updatedNotifications.add(Notification(
            date: date,
            notice: _updatedNotifications.first.notice,
            time: _updatedNotifications.first.time));
      }
    }

    await getIt.get<DbController>().update(habit.copyWith(
          completedDays: _updatedCompletedDays,
          selectedDays: _updatedSelectedDays,
          notifications: _updatedNotifications,
        ));
  }
}
