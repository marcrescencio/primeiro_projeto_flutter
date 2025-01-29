import 'package:alura_curso_primeiro_projeto_flutter/components/task.dart';
import 'package:alura_curso_primeiro_projeto_flutter/data/task_dao.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext contextInitial) {
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
            actions: [
              IconButton(onPressed: (){
                setState(() {});}, icon: Icon(Icons.refresh))],
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
      body: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 85),
          child: FutureBuilder<List<Task>>(
              future: TaskDao().findAll(),
              builder: (context, snapshot){
                List<Task>? items = snapshot.data;
                switch(snapshot.connectionState){

                  case ConnectionState.none:
                    return Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],),
                    );
                  case ConnectionState.waiting:
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],),
                    );
                  case ConnectionState.active:
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],),
                    );
                  case ConnectionState.done:
                    if(snapshot.hasData && items != null){
                      if(items.isNotEmpty){
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index){
                            final Task task = items[index];
                            return task;
                          },);
                      }
                      return Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 112,
                            ),
                            Text(
                              'Nenhuma tarefa cadastrada',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Text('Erro ao carregar tarefas');
                }
                return Text('Erro desconhecido');

          }),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            contextInitial,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: contextInitial,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
