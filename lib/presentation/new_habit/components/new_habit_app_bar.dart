import 'package:flutter/material.dart';
import 'package:habits/generated/l10n.dart';

class NewHabitAppBar extends StatelessWidget {
  final VoidCallback cancelOnPressed;

  const NewHabitAppBar({
    Key? key,
    required this.cancelOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Text(
              S.of(context).cancel,
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: cancelOnPressed,
          ),
          Text(
            S.of(context).new_habits,
            style: Theme.of(context).textTheme.headline2,
          ),
          GestureDetector(
            child: Text(
              S.of(context).done,
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
