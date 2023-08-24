import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'colors_event.dart';
part 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  ColorsBloc() : super(ColorsChanged(Colors.blue)) {
    on<ChangeBackgroundEvent>(changeBackgroundEvent);
  }

  FutureOr<void> changeBackgroundEvent(
      ChangeBackgroundEvent event, Emitter<ColorsState> emit) {
        print('event in ${event.color}');
    // if (event.color == Colors.blue) {
      emit(ColorsChanged(event.color));
    // } else {
    //   emit(ColorsChanged(Colors.blue));
    // }
  }
}
