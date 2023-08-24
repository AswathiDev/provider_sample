part of 'colors_bloc.dart';

@immutable
abstract class ColorsEvent {}

 class ChangeBackgroundEvent extends ColorsEvent{
   final Color color;

  ChangeBackgroundEvent(this.color);
}
