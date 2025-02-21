import 'package:alura_curso_primeiro_projeto_flutter/data/task_inherited.dart';
import 'package:flutter/material.dart';

import '../components/task.dart';
import '../data/task_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultValidator(String? value) {
    if(value != null && value.isEmpty) {
      if (int.parse(value) > 5 ||
          int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext contextForm) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da Tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Nome',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     validator: (value) {
                       if (difficultValidator(value)) {
                         return 'Insira a dificuldade entre 1 e 5';
                       }
                       return null;
                     },
                     keyboardType: TextInputType.number,
                    controller: difficultyController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Dificuldade',
                      border: OutlineInputBorder(),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                   ),
                  ),
                  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira a URL da imagem';
                        }
                        return null;
                      },
                     keyboardType: TextInputType.url,
                     onChanged: (text) {
                       setState(() {});
                     },
                     controller: imageController,
                     textAlign: TextAlign.center,
                     decoration: const InputDecoration(
                       hintText: 'Imagem',
                       border: OutlineInputBorder(),
                       fillColor: Colors.white70,
                       filled: true,
                     ),
                   ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2,),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/nophoto.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        TaskDao().save(Task(
                          taskName: nameController.text,
                          difficulty: int.parse(difficultyController.text),
                          linkImage: imageController.text,
                          colorsList: [
                            Colors.blue,
                            Colors.green,
                            Colors.red,
                            Colors.yellow,
                            Colors.purple,
                          ],
                        ));
                        ScaffoldMessenger.of(contextForm).showSnackBar(
                          const SnackBar(content: Text('Criando nova Tarefa...')),
                        );
                        Navigator.pop(contextForm);
                      }

                    },
                    child: Text('Adicionar!'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
