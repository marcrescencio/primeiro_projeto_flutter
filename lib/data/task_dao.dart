
import 'package:alura_curso_primeiro_projeto_flutter/components/task.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      'id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    final Database db = await getDatabase();
    var itemExists = await find(task.taskName);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      return await db.insert(_tablename, taskMap);
    } else {
      return await db.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [task.taskName]);
    }
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> mapOfTasks = Map();
    mapOfTasks[_name] = task.taskName;
    mapOfTasks[_difficulty] = task.difficulty;
    mapOfTasks[_image] = task.linkImage;
    return mapOfTasks;
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> tasksMap) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> row in tasksMap) {
      final Task task = Task(
        taskName: row[_name],
        linkImage: row[_image],
        difficulty: row[_difficulty],
        colorsList: [],
      );
      tasks.add(task);
    }
    return tasks;
  }

  Future<List<Task>> find(String taskName) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
    return toList(result);
  }

  delete(String taskName) async {
    final Database db = await getDatabase();
    return await db.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }
}
