import 'package:flutter/material.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String linkImage;
  final int difficulty;
  final List<Color> colorsList;

  const Task({
    required this.taskName,
    required this.linkImage,
    required this.difficulty,
    required this.colorsList,
    super.key
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  Color containerColor = Colors.blue;
  int colorIndex = 0;

  void _updateContainerColor() {
    setState(() {
      if ((widget.difficulty > 0) ? (nivel / widget.difficulty) / 10 >= 1 : false) {
        nivel = 0; // Reinicia a contagem
        colorIndex = (colorIndex + 1) % widget.colorsList.length; // Alterna para a próxima cor
        containerColor = widget.colorsList[colorIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: containerColor,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          widget.linkImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.taskName,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                        ),
                        Difficulty(difficultyLevel: widget.difficulty,)
                      ],
                    ),
                    SizedBox(
                      width: 62,
                      height: 62,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          nivel++;
                          _updateContainerColor();
                        });
                      },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up, color: Colors.white,),
                            Text('UP', style: TextStyle(fontSize: 10, color: Colors.white,), ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.difficulty > 0) ? (nivel/widget.difficulty) / 10 : 1,
                  //      minHeight: 15,
                        backgroundColor: Colors.black26,
                        color: Colors.white,
                      ),
                    ),
                    Text('Nivel: $nivel',
                      style: TextStyle(fontSize: 18, color: Colors.white),),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

