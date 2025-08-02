import 'package:flutter/material.dart';
import 'package:provider_to_do/models/to_do_model.dart';

class ToDoProvider extends ChangeNotifier {
final List<ToDoModel> _toDoList = [];
List<ToDoModel> get allToDoList  => _toDoList;

void addToDoList(ToDoModel todoModel) {
  _toDoList.add(todoModel);
  notifyListeners();
}

void toDoStatusChange(ToDoModel todoModel){
  final index = _toDoList.indexOf(todoModel);
  _toDoList[index].toggleChanged();
  notifyListeners();
}

void removeToDoList( ToDoModel todoModel){
  final index = _toDoList.indexOf(todoModel);
  _toDoList.removeAt(index);
  notifyListeners();
}
}