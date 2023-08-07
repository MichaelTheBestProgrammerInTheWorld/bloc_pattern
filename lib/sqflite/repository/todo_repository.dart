import 'package:bloc_pattern/sqflite/database/todo_dao.dart';
import 'package:bloc_pattern/sqflite/model/todo.dart';

class TodoRepository {
  final todoDao = TodoDao();

  Future getAllTodos({required String query}) => todoDao.getTodos(query: query);

  Future insertTodo(Todo todo) => todoDao.createTodo(todo);

  Future updateTodo(Todo todo) => todoDao.updateTodo(todo);

  Future deleteTodoById(int id) => todoDao.deleteTodo(id);

  //We are not going to use this in the demo
  Future deleteAllTodos() => todoDao.deleteAllTodos();
}
