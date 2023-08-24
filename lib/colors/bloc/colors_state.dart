part of 'colors_bloc.dart';

@immutable
abstract class ColorsState {
  get color => null;
  
}
abstract class ColorsActionState extends ColorsState{}


final class ColorsInitial extends ColorsActionState {}
final class ColorsChanged extends ColorsActionState {
   final Color color;

  ColorsChanged(this.color); 
}

