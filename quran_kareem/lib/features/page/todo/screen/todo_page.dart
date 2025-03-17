import 'package:flutter/material.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/features/page/todo/datebase/db_server.dart';
import 'package:quran_kareem/features/page/todo/model/task.dart';
import 'package:quran_kareem/features/page/todo/widget/build_header.dart';
import 'package:quran_kareem/features/page/todo/widget/task_listview.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
  await DBServer.deleteTask(id);
  setState(() {
    tasks.removeWhere((task) => task.id == id);
  });
}


  Future<void> _loadTasks() async {
    tasks = await DBServer.getTasks();
    setState(() {}); 
  }

  Future<void> _addTask(Task task) async {
    await DBServer.insertTask(task);
    _loadTasks(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => _buildTaskDialog(),
          );
        },
        backgroundColor: Colors.white,
        child: const Text(
          "+",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            BuildHeader(),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks available",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : TaskListView(
                      tasks: tasks,
                      onDelete: (id) => _deleteTask(id),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskDialog() {
    final title = TextEditingController();
    final description = TextEditingController();
    final date = TextEditingController();

    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(controller: title, hint: 'Title..', icon: Icons.title),
          const SizedBox(height: 3),
          _buildTextField(controller: description, hint: 'Description..', icon: Icons.description),
          const SizedBox(height: 3),
          _buildTextField(
            controller: date,
            hint: 'Select Date',
            icon: Icons.date_range,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2026, 12, 31),
              );
              if (pickedDate != null) {
                date.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              }
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (title.text.isNotEmpty && description.text.isNotEmpty && date.text.isNotEmpty) {
                Task newTask = Task(title: title.text, description: description.text, date: date.text);
                _addTask(newTask);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("الرجاء ملء جميع الحقول"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            ),
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      ),
    );
  }
}
