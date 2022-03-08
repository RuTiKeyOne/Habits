import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habits/domain/model/habit.dart';

@immutable
abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];

  const MainState();
}

class InitialState extends MainState {}

class LoadingState extends MainState {}

class LoadedState extends MainState {
  final List<Habit> habits;

  const LoadedState({
    required this.habits,
  });
}

class ErrorState extends MainState {
  final String error;
  @override
  List<Object?> get props => [error];

  const ErrorState({required this.error});
}
