import 'package:redux/redux/store.dart';

enum ActionState { start, loading, success, error }

class AppState {
  final ActionState value;
  AppState({required this.value});
}

AppState reducer(AppState state, ActionState action) {
  switch (action) {
    case ActionState.start:
      return AppState(value: ActionState.start);
    case ActionState.loading:
      return AppState(value: ActionState.loading);
    case ActionState.success:
      return AppState(value: ActionState.success);

    case ActionState.error:
      return AppState(value: ActionState.error);

    default:
      return AppState(value: ActionState.start);
  }
}

final appStore = Store<AppState, ActionState>(
    initialState: AppState(value: ActionState.start), reducer: reducer);
