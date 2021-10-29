import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: const Color(0xff1D5A75),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 50.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
              decoration: const InputDecoration(
                border: kTextFieldInputBorder,
                enabledBorder: kTextFieldInputBorder,
                focusedBorder: kTextFieldInputBorder,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
              onPressed: () {
                if (newTaskTitle.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Please Add A Task.'),
                          content:
                              const Text('Text Field should Not Be Empty.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OKAY'),
                            ),
                          ],
                        );
                      });
                } else {
                  Provider.of<TasksData>(context, listen: false)
                      .addNewTask(newTaskTitle);
                  TextEditingController().clear();
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
