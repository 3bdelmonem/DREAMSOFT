import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/item.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment({
    required Item item,
  }) {
    item.quntity += 1;
    emit(ChangeValueState());
    emit(CounterInitial());
  }

  void decrement({
    required Item item,
  }) {
    if (item.quntity > 1) {
      item.quntity -= 1;
      emit(ChangeValueState());
      emit(CounterInitial());
    }
  }
}
