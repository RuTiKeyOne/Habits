import 'package:habits/domain/model/habit.dart';
import 'package:habits/domain/repository/update_date_repository.dart';
import 'package:habits/internal/db_di/db_controller.dart';
import 'package:habits/internal/locator.dart';

class UpdateCompletedDateRepositoryImpl extends UpdateDateRepository {
  @override
  Future<void> updateDate(
      {required Habit habit, required DateTime date}) async {
    final _updatedCompletedDays = habit.completedDays;
    _updatedCompletedDays.add(date);
    final _updatedSelectedDays = habit.selectedDays;
    _updatedSelectedDays.remove(date);
    await getIt.get<DbController>().update(habit.copyWith(
          completedDays: _updatedCompletedDays,
          selectedDays: _updatedSelectedDays,
        ));
  }
}