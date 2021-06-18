import 'package:flutter/material.dart' hide Action, State;

class Store<State, Action> extends ChangeNotifier {
  State _state;

  final State Function(State state, Action action) reducer;

  Store({required State initialState, required this.reducer})
      : _state = initialState;

  State get state => _state;

  void dispatcher(Action action) {
    _state = this.reducer(state, action);
    notifyListeners();
  }
}
