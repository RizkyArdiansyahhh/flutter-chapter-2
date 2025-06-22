import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValue(value: 0)) {
    on<CounterIncrementPressed>((event, emit) {
      final current = (state as CounterValue).value;
      emit(CounterValue(value: current + 1));
    });
  }
}
