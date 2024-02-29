import 'dart:async';
import 'dart:math';
import 'package:protos/protos.dart';

class TodoService extends TodoServiceBase {
  List<Todo> todos = [];
  StreamController<Todo> streamController = StreamController<Todo>.broadcast();

  @override
  Future<Todo> addTodo(ServiceCall call, Todo request) async {
    todos.add(request);
    streamController.add(request);
    return request;
  }

  @override
  Future<Todos> getAllTodos(ServiceCall call, TodoQuery request) async {
    Todos allTodos = Todos(todos: todos);
    return allTodos;
  }

  @override
  Future<Todo> getTodo(ServiceCall call, TodoQuery request) async {
    Todo searchedTodo =
        todos.where((element) => element.id == request.id).first;
    return searchedTodo;
  }

  @override
  Stream<Todo> streamTodo(ServiceCall call, TodoQuery request) async* {
    yield* streamController.stream;
  }
}
