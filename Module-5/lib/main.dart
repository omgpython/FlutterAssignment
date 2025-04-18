import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_5/task.dart';

import 'db_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  loadTasks() async {
    tasks = await DBHelper.getTasks();
    setState(() {});
  }

  // Updated function to return a Color based on priority
  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return Colors.red; // High priority is red
      case 'average':
        return Colors.blue; // Average priority is blue
      case 'low':
        return Colors.green; // Low priority is green
      default:
        return Colors.black; // Default to black if unknown priority
    }
  }

  // Delete task
  _deleteTask(Task task) async {
    bool? confirmDelete = await _showDeleteConfirmationDialog();
    if (confirmDelete == true) {
      await DBHelper.deleteTask(task.id!); // Delete task from DB
      loadTasks(); // Reload tasks from DB
    }
  }

  // Edit task
  _editTask(Task task) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTaskScreen(task: task)),
    );

    // If the task was updated, reload the tasks
    if (result != null && result) {
      loadTasks();
    }
  }

  // Show confirmation dialog for delete
  Future<bool?> _showDeleteConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Management"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddTaskScreen()),
              ).then((_) {
                loadTasks();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          final priorityColor = getPriorityColor(task.priority);
          final isDue = DateTime.now().isAfter(
            DateFormat("yyyy-MM-dd HH:mm").parse('${task.date} ${task.time}'),
          );
          final taskColor =
              isDue
                  ? Colors.blue
                  : (task.isCompleted ? Colors.grey : priorityColor);

          return ListTile(
            title: Text(task.name, style: TextStyle(color: taskColor)),
            subtitle: Text(
              '${task.description}\n${task.date} ${task.time}',
              style: TextStyle(color: taskColor),
            ),
            tileColor: isDue ? Colors.blue[50] : null,
            onTap: () => _editTask(task), // Navigate to edit task on tap
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Edit icon
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _editTask(task),
                ),
                // Delete icon
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteTask(task),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  String _priority = 'low';

  // Open Date Picker
  _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  // Open Time Picker
  _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        _timeController.text = selectedTime.format(context);
      });
    }
  }

  _addTask() async {
    final task = Task(
      name: _nameController.text,
      description: _descriptionController.text,
      date: _dateController.text,
      time: _timeController.text,
      priority: _priority,
    );
    await DBHelper.insertTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date (yyyy-mm-dd)'),
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time (HH:mm)'),
              onTap: () => _selectTime(context),
              readOnly: true,
            ),
            DropdownButton<String>(
              value: _priority,
              onChanged: (String? newValue) {
                setState(() {
                  _priority = newValue!;
                });
              },
              items:
                  <String>[
                    'low',
                    'average',
                    'high',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
            ElevatedButton(onPressed: _addTask, child: Text('Add Task')),
          ],
        ),
      ),
    );
  }
}

class EditTaskScreen extends StatefulWidget {
  final Task task;

  EditTaskScreen({required this.task});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  String _priority = 'low';

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.task.name;
    _descriptionController.text = widget.task.description;
    _dateController.text = widget.task.date;
    _timeController.text = widget.task.time;
    _priority = widget.task.priority;
  }

  // Open Date Picker
  _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateFormat('yyyy-MM-dd').parse(widget.task.date),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  // Open Time Picker
  _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(widget.task.time.split(':')[0]),
        minute: int.parse(widget.task.time.split(':')[1]),
      ),
    );
    if (selectedTime != null) {
      setState(() {
        _timeController.text = selectedTime.format(context);
      });
    }
  }

  _updateTask() async {
    widget.task.name = _nameController.text;
    widget.task.description = _descriptionController.text;
    widget.task.date = _dateController.text;
    widget.task.time = _timeController.text;
    widget.task.priority = _priority;

    await DBHelper.updateTask(widget.task);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date (yyyy-mm-dd)'),
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time (HH:mm)'),
              onTap: () => _selectTime(context),
              readOnly: true,
            ),
            DropdownButton<String>(
              value: _priority,
              onChanged: (String? newValue) {
                setState(() {
                  _priority = newValue!;
                });
              },
              items:
                  <String>[
                    'low',
                    'average',
                    'high',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
            ElevatedButton(onPressed: _updateTask, child: Text('Update Task')),
          ],
        ),
      ),
    );
  }
}
