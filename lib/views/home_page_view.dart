import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/controllers/todo_controller.dart';
import 'package:redux/redux/app_redux.dart';
import 'package:redux/redux/store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoController todoController = TodoController();

  Widget _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          todoController.start();
        },
        child: SizedBox(
          width: 200,
          child: Row(
            children: [
              Expanded(flex: 1, child: Icon(Icons.drag_indicator)),
              Expanded(flex: 2, child: Text('Tentar outra vez'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _start() {
    return Container();
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _success() {
    return ListView.builder(
        itemCount: todoController.todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoController.todos[index].title),
            leading: Checkbox(
              onChanged: (_) {},
              value: todoController.todos[index].completed,
            ),
          );
        });
  }

  stateManagement(ActionState action) {
    switch (action) {
      case ActionState.start:
        return _start();
      case ActionState.loading:
        return _loading();
      case ActionState.success:
        return _success();
      case ActionState.error:
        return _error();

      default:
        return _start();
    }
  }

  @override
  void initState() {
    todoController.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: appStore,
        builder: (context, index) {
          return stateManagement(appStore.state.value);
        },
      ),
    );
  }
}
