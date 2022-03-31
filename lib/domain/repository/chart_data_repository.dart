import 'package:fl_chart/fl_chart.dart';
import 'package:habits/domain/model/habit.dart';

abstract class ChartDataRepository {
  List<FlSpot> getFlSpotsData(Habit habit);
}
