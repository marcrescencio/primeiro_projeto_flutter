import 'package:alura_curso_primeiro_projeto_flutter/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
    Task(
      taskName: 'Aprender Flutter',
      linkImage:
      'assets/images/flutter.png',
      difficulty: 3,
      colorsList: [
        Colors.blue,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.purple,
      ],
    ),
    Task(
      taskName: 'Andar de bike',
      linkImage:
      'assets/images/biker.jpeg',
      difficulty: 2,
      colorsList: [
        Colors.blue,
        Colors.black45,
        Colors.deepOrange,
        Colors.greenAccent,
        Colors.grey,
      ],
    ),
    Task(
      taskName: 'Jogar futebol',
      linkImage:
      'assets/images/futebol.jpeg',
      difficulty: 1,
      colorsList: [
        Colors.blue,
        Colors.pink,
        Colors.red,
        Colors.teal,
        Colors.yellowAccent,
      ],
    ),
    Task(
      taskName: 'Ler livros',
      linkImage:
      'assets/images/leitura.jpeg',
      difficulty: 5,
      colorsList: [
        Colors.blue,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.purple,
      ],
    ),
    Task(
      taskName: 'Dormir',
      linkImage:
      'assets/images/dormir.jpg',
      difficulty: 1,
      colorsList: [
        Colors.blue,
        Colors.deepPurple,
        Colors.lime,
        Colors.purple,
        Colors.grey,
      ],
    ),
    Task(
      taskName: 'Correr',
      linkImage:
      'assets/images/correr.jpg',
      difficulty: 4,
      colorsList: [
        Colors.blue,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.purple,
      ],
    ),
  ];

  void newTask(String name, String image, int difficulty, List<Color> colorsList) {
    taskList.add(Task(taskName: name, linkImage: image, difficulty: difficulty, colorsList: colorsList));
  }


  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
