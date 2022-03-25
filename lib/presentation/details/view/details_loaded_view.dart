import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';
import 'package:habits/generated/l10n.dart';
import 'package:habits/presentation/details/components/details_app_bar.dart';
import 'package:habits/presentation/details/components/header_details.dart';
import 'package:habits/presentation/widgets/details_divider.dart';
import 'package:habits/presentation/widgets/details_text_item.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DetailsLoadedView extends StatelessWidget {
  final Habit habit;
  const DetailsLoadedView({Key? key, required this.habit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _percent = habit.completedDays.length / habit.totalDays.length;
    final _now = DateTime.now();
    final _percemtMonth = ((habit.completedDays
                    .where((element) => element.month == _now.month)
                    .toList()
                    .length /
                habit.totalDays
                    .where((element) => element.month == _now.month)
                    .toList()
                    .length) *
            100)
        .toInt();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Column(
        children: [
          DetailsAppBar(
            title: habit.title,
          ),
          const SizedBox(height: 10),
          HeaderDetails(habit: habit),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularPercentIndicator(
                        percent: _percent,
                        lineWidth: 5.0,
                        radius: 30.0,
                        center: Text(
                          _percent.toStringAsFixed(1),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        progressColor: Theme.of(context).indicatorColor,
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          DetailsTextItem(
                            bodyText: habit.totalDays.length.toString(),
                            bottomText: S.of(context).times,
                          ),
                          const DetailsDiveder(),
                          DetailsTextItem(
                              bodyText: habit.completedDays.length.toString(),
                              bottomText: S.of(context).done_1),
                          const DetailsDiveder(),
                          DetailsTextItem(
                              bodyText: _percemtMonth.toString() + "%",
                              bottomText: S.of(context).month),
                          const DetailsDiveder(),
                          DetailsTextItem(
                              bodyText:
                                  (_percent * 100).toStringAsFixed(0) + "%",
                              bottomText: S.of(context).total),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
