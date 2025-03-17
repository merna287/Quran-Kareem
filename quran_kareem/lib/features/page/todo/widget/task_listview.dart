import 'package:flutter/material.dart';
import 'package:quran_kareem/features/page/todo/model/task.dart';
import 'package:quran_kareem/features/page/todo/widget/task_item.dart'; 

class TaskListView extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onDelete;

  const TaskListView({super.key, required this.tasks, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          list: tasks[index],
          onDelete: () {
            if (tasks[index].id != null) {
              onDelete(tasks[index].id!);
            } else {
              print("Error: Task ID is null");
            }
          },
        );
      },
    );
  }
}
