import 'package:flutter_bloc/flutter_bloc.dart';

//Estados
abstract class CounterState {}

class CounterInit extends CounterState {
  final int data = 0;
}

class IncrementState extends CounterState {
  final int data;
  IncrementState(this.data);
}

class DecrementState extends CounterState {
  final int data;
  DecrementState(this.data);
}

//Este es el Cubit
//aqui se le indica estado que va inicializar, en este caso un int (entero)
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInit());

  increment() {
    print(state);
    if (state is CounterInit) {
      CounterInit current = state as CounterInit;
      print(current.data);

      emit(IncrementState(current.data + 1));
    } else if (state is IncrementState) {
      // emit(IncrementState(state.));
      IncrementState current = state as IncrementState;
      emit(IncrementState(current.data + 1));
    }
  }

  decrement() {
    print("Decrement");
  }

  restar() {
    print("Restar");
  }
}
