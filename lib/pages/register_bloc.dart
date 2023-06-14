import 'dart:async';

//Aqui se ha creado eventos, acciones que deseo que haga
enum RegisterEvent {
  increment,
  decrement,
  register,
  delete,
}

class RegisterBloc {
  int _myCounter = 0;

  get myCounter => _myCounter;

  //Por este StreamController estamos indicando que van a fluir int (enteros)
  final StreamController<int> _controller = StreamController.broadcast();
  Stream<int> get stream => _controller.stream;

//Desde aquì manejo un evento
  void addCounter(RegisterEvent event) {
    switch (event) {
      case RegisterEvent.increment:
        _myCounter++;
        break;
      case RegisterEvent.decrement:
        _myCounter--;
        break;
      case RegisterEvent.register:
        break;
      case RegisterEvent.delete:
        break;
    }

    _controller.add(_myCounter);

    // _myCounter++; //se encarga de sumar 1 a 1.
    // _controller.add(_myCounter); //agrega al flujo del stream
  }

//Una funciòn para que el controlador se cierre
  void dispose() {
    _controller.close();
  }
}
