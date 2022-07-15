import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
//            Instead using Provider.of<TaskData>(context) we make an object using Consumer widget using build method
            taskTitle: task.name,
            isChecked: task.isDone,
            checkBoxCallBack: (bool checkBoxState) {
              taskData.updateTask(task);
            },
            longPressCallBack: (){
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
