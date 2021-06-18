import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux/models/todo_model.dart';

class TodoRepository {
  Future<List<TodoModel>> fetchTodo() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);

    var jsonResponse = jsonDecode(response.body) as List;

    return jsonResponse.map((e) => TodoModel.fromJson(e)).toList();
  }
}
