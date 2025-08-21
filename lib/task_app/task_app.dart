import 'package:flutter/material.dart';
import 'package:prov/task_app/tak_app_provider.dart';
import 'package:provider/provider.dart';

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskAppProvider>(
        builder: (context, taskProvider, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              )),
              controller: taskProvider.textController,
            ),
            ElevatedButton(
                onPressed: () {
                  taskProvider.addTask(taskProvider.textController.text);
                  taskProvider.textController.clear();
                },
                child: Text("Assign Task")),
            Text(taskProvider.textController.text),
            Expanded(
              child: ListView.builder(
                  itemCount: taskProvider.task.length,
                  itemBuilder: (context, index) {
                    final task = taskProvider.task[index];

                    return ListTile(
                      title: Row(
                        children: [
                          Text(task),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                taskProvider.removeTask(task);
                                taskProvider.addCompletedTask(task);
                              },
                              child: Icon(Icons.crop_square_sharp))
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          taskProvider.removeTask(task);
                        },
                      ),
                    );
                  }),
            ),
            Text("Completed Task"),
            taskProvider.completedTask.isEmpty
                ? Text("NO task")
                : Expanded(
                    child: ListView.builder(
                        itemCount: taskProvider.completedTask.length,
                        itemBuilder: (context, index) {
                          final completedTask =
                              taskProvider.completedTask[index];
                          return ListTile(title: Text(completedTask));
                        })),
          ],
        ),
      ),
    );
  }
}
