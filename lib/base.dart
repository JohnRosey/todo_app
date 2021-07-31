import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model/tache.dart';
import 'model/todo.dart';



class DatabaseHelper {

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE tache(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
        await db.execute(
            "CREATE TABLE todo(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, estFait INTEGER)");
        return db;
      },
      version: 1,
    );
  }

  Future<int> insertTask(Tache task) async {
    int taskId = 0;
    Database _db = await database();
    await _db.insert(
        'tache', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateTaskTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tache SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateTaskDescription(int id, String description) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE tache SET description = '$description' WHERE id = '$id'");
  }

   Future<void> insertTodo(Todo todo) async {
    Database _db = await database();
    await _db.insert('todo', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Tache>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tache');
    return List.generate(taskMap.length, (index) {
      return Tache(id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          description: taskMap[index]['description']);
    });
  }

  Future<List<Todo>> getTodo(int taskId) async {
    Database _db = await database();
    List<Map<String, dynamic>> todoMap = await _db.rawQuery(
        "SELECT * FROM todo WHERE taskId = $taskId");
    return List.generate(todoMap.length, (index) {
      return Todo(id: todoMap[index]['id'],
          title: todoMap[index]['title'],
          taskId: todoMap[index]['taskId'],
          estFait: todoMap[index]['estFait']);
    });
  }
    Future<void> updateTodoDone(int id, int estFait) async {
      Database _db = await database();
      await _db.rawUpdate(
          "UPDATE todo SET estFait = '$estFait' WHERE id = '$id'");
    }


    Future<void> deleteTask(int id) async {
      Database _db = await database();
      await _db.rawDelete("DELETE FROM tache WHERE id = '$id'");
      await _db.rawDelete("DELETE FROM todo WHERE taskId = '$id'");
    }
  }
