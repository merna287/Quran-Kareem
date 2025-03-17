import 'package:flutter/material.dart';
import 'package:quran_kareem/features/page/todo/datebase/db_server.dart';
import 'package:quran_kareem/features/page/todo/model/task.dart';

class TaskItem extends StatefulWidget {
  final Task list;
  final VoidCallback onDelete;

  TaskItem({super.key, required this.list, required this.onDelete});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54 ,
                  blurRadius: 10, 
                  spreadRadius: 1, 
                  offset: Offset(0, 4), 
                ),
              ],
            ),
            child: Card(
              color: Colors.indigo[300],
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      widget.list.title,
                      style: const TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Icon(Icons.check_box, color: isClicked ? Colors.green : Colors.grey),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () async {
                        await DBServer.deleteTask(widget.list.id!);
                        widget.onDelete();  
                      },
                      child: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.list.description,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      widget.list.date,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
