import '../../domain/model/habit.dart';
import '../../domain/repository/update_date_repository.dart';
import '../../internal/db_di/db_controller.dart';
import '../../internal/locator.dart';

class UpdateCompletedDateRepositoryImpl extends UpdateDateRepository {
  @override
  Future<void> updateDate(
      {required Habit habit, required DateTime date}) async {
    final _updatedCompletedDays = habit.completedDays;
    _updatedCompletedDays.add(date);
    final _updatedSelectedDays = habit.selectedDays;
    _updatedSelectedDays.remove(date);

    final _updatedNotifications = habit.notifications;

    if (_updatedNotifications != null && _updatedNotifications.isNotEmpty) {
      _updatedNotifications.remove(_updatedNotifications
          .firstWhere((element) => element.date.day == date.day));
    }

    await getIt.get<DbController>().update(habit.copyWith(
          completedDays: _updatedCompletedDays,
          selectedDays: _updatedSelectedDays,
          notifications: _updatedNotifications,
        ));
  }
}
