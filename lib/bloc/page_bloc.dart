import 'package:flutter_bloc/flutter_bloc.dart';

class PageBloc extends Bloc<PageEvent, int> {
  PageBloc() : super(0) {
    on<PageChanged>((event, emit) {
      emit(event.value);
    });
  }
}

class PageEvent {}

class PageChanged extends PageEvent {
  PageChanged(this.value);
  int value;
}