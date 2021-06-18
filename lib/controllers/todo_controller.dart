import 'package:redux/models/todo_model.dart';
import 'package:redux/redux/app_redux.dart';
import 'package:redux/repositories/todo_repository.dart';

class TodoController {
  late List<TodoModel> todos;
  final TodoRepository todoRepository = TodoRepository();
  start() async {
    try {
      appStore.dispatcher(ActionState.loading);
      todos = await todoRepository.fetchTodo();
      appStore.dispatcher(ActionState.success);
    } catch (e) {
      print(e);
      appStore.dispatcher(ActionState.error);
    }
  }
}
