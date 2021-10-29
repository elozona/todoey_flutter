import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/tasks_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TasksData>(context).tasks;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final task = tasks[index];
        return TasksTile(
          taskText: task.taskTitle,
          isChecked: task.isDone,
          checkboxCallback: (checkBoxState) =>
              Provider.of<TasksData>(context, listen: false).updateTask(task),
          textCallback: () =>
              Provider.of<TasksData>(context, listen: false).deleteTask(task),
        );
      },
      itemCount: tasks.length,
    );
  }
}
