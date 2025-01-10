import 'package:alura_curso_primeiro_projeto_flutter/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            leading: Container(),
            title: Row(
              children: [
                Icon(Icons.add_task, color: Colors.white),
                SizedBox(width: 18),
                Text(
                  'Tarefas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //      backgroundColor: Colors.blue,
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: (opacity == true) ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: ListView(
          children: [
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
                Colors.red.shade700,
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
            SizedBox(height: 80,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}