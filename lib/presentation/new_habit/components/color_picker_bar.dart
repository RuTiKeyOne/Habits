import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/presentation/new_habit/widgets/color_item.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';

class ColorPickerBar extends StatefulWidget {
  const ColorPickerBar({Key? key}) : super(key: key);

  @override
  State<ColorPickerBar> createState() => _ColorPickerBarState();
}

class _ColorPickerBarState extends State<ColorPickerBar> {
  int selectedIndex = 0;

  final List<Color> colorItems = [
    const Color(0xffE76967),
    const Color(0xffF5F186),
    const Color(0xff2DC976),
    const Color(0xff5665F2),
    const Color(0xff8F86F3),
    const Color(0xffAE8F72),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 50,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colorItems.length,
            itemBuilder: (builder, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ColorItem(
                color: colorItems[index],
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  BlocProvider.of<NewHabitBloc>(context)
                      .add(ColorChangedEvent(color: colorItems[selectedIndex]));
                },
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
