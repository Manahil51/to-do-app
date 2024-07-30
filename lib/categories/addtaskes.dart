import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  final Function(Task) onTaskAdded;

  const AddTaskPage({Key? key, required this.onTaskAdded}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int? _priority;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextField(
              controller: _descriptionController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 16),
            Text(
              'Date: ${_selectedDate?.toLocal() ?? 'Select Date'}',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                setState(() {
                  _selectedDate = pickedDate;
                });
              },
              child: const Text('Select Date'),
            ),
            SizedBox(height: 16),
            Text(
              'Time: ${_selectedTime?.format(context) ?? 'Select Time'}',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {
                  _selectedTime = pickedTime;
                });
              },
              child: const Text('Select Time'),
            ),
            SizedBox(height: 16),
            Text(
              'Priority',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: ListTile(
                    title: Text(
                      'Priority ${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Radio<int>(
                      value: index + 1,
                      groupValue: _priority,
                      onChanged: (int? value) {
                        setState(() {
                          _priority = value;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final Task newTask = Task(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  date: _selectedDate,
                  time: _selectedTime,
                  priority: _priority,
                );
                widget.onTaskAdded(newTask);
                Navigator.pop(context);
              },
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String description;
  final DateTime? date;
  final TimeOfDay? time;
  final int? priority;

  Task({
    required this.title,
    required this.description,
    this.date,
    this.time,
    this.priority,
  });
}
