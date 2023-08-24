part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}
abstract class ThemeActionState extends ThemeState {}

final class ThemeInitial extends ThemeState {}
final class ThemeChanged extends ThemeActionState {}
