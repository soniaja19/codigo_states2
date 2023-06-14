import 'dart:async';

//Aqui se ha creado eventos, acciones que deseo que haga
// enum RegisterEvent {
//   increment,
//   decrement,
//   register,
//   delete,
// }

//Con esta opciòn  se ha creado eventos mediante clases
abstract class RegisterEvent {}

class IncrementEvent extends RegisterEvent {
  final int data;
  IncrementEvent(this.data);
}

class DecrementEvent extends RegisterEvent {
  final int data;
  DecrementEvent(this.data);
}

class UpdateEvent extends RegisterEvent {}

class DeleteEvent extends RegisterEvent {}

class RegisterBloc {
  int _myCounter = 0;

  get myCounter => _myCounter;

  //Por este StreamController estamos indicando que van a fluir int (enteros)
  final StreamController<int> _controller = StreamController.broadcast();
  Stream<int> get stream => _controller.stream;

//Desde aquì manejo el evento que deseo y las acciones, es lo normal que se hace en bloc

  void addCounter(RegisterEvent event) {
    if (event is IncrementEvent) {
      emit(_myCounter + event.data);
    } else if (event is DecrementEvent) {
      emit(_myCounter - 1);
    }

    /// Se utiliza estos eventos cuando usamos emun, con el switch
    // switch (event) {
    //   case RegisterEvent.increment:
    //     emit(_myCounter +
    //         1); // la funciòn emit se encarga de agregar al contador
    //     break;
    //   case RegisterEvent.decrement:
    //     emit(_myCounter - 1);
    //     break;
    //   case RegisterEvent.register:
    //     break;
    //   case RegisterEvent.delete:
    //     break;
    // }

    //  _controller.add(_myCounter);

    // _myCounter++; //se encarga de sumar 1 a 1.
    // _controller.add(_myCounter); //agrega al flujo del stream
  }

  emit(int value) {
    if (value != _myCounter) {
      _myCounter = value;
      _controller.add(_myCounter);
    }
  }

//Una funciòn para que el controlador se cierre
  void dispose() {
    _controller.close();
  }
}
