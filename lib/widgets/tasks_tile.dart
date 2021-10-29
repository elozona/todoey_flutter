import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  const TasksTile(
      {Key? key,
      this.taskText = '',
      this.isChecked = false,
      this.checkboxCallback,
      this.textCallback})
      : super(key: key);

  final String taskText;
  final bool? isChecked;
  final void Function(bool? input)? checkboxCallback;
  final void Function()? textCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: textCallback,
      child: CheckboxListTile(
        activeColor: Colors.lightBlueAccent,
        title: Text(
          taskText,
          style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
