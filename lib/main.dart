import 'package:alura_curso_primeiro_projeto_flutter/data/task_inherited.dart';
import 'package:alura_curso_primeiro_projeto_flutter/screens/form_screen.dart';
import 'package:alura_curso_primeiro_projeto_flutter/screens/initial_screen.dart';
import 'package:alura_curso_primeiro_projeto_flutter/theme/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: tema,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: TaskInherited(child: InitialScreen()),
      // home: InitialScreen(),
    );
  }
}





