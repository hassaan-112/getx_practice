import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/TaskController.dart';
import 'addTask.dart';

class THomescreen extends StatefulWidget {
  const THomescreen({super.key});

  @override
  State<THomescreen> createState() => _THomescreenState();
}

class _THomescreenState extends State<THomescreen> {
  final TaskController taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks"), centerTitle: true,leading: IconButton(onPressed: (){
    Get.changeTheme(Get.theme.brightness==Brightness.dark?ThemeData.light():ThemeData.dark());
    setState(() {

    });
    }, icon: Icon(Get.theme.brightness==Brightness.dark?Icons.dark_mode:Icons.light_mode)),),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Get.theme.brightness==Brightness.light?Colors.white.withValues(alpha:0.1):Colors.black.withValues(alpha:0.1),
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
              height: Get.height * 0.5,

              child: Obx(
                () => taskController.tasks.isEmpty
                    ? Center(
                        child: Text("No Tasks", style: TextStyle(fontSize: 20)),
                      )
                    : ListView.builder(
                        itemCount: taskController.tasks.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => Card(
                              child: ListTile(
                                title: Text(taskController.tasks[index].task,style:TextStyle(overflow: TextOverflow.ellipsis,),maxLines: 3,),
                                leading: Icon(
                                  taskController.tasks[index].isCompleted
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    taskController.removeTask(index);
                                  },
                                  icon: Icon(Icons.delete),),

                                onTap: () {
                                  taskController.updateTask(index);
                                },
                                onLongPress: () {
                                  dialog(taskController.tasks[index].task,true,index);
                                  // taskController.removeTask(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                dialog(null,false,null);
              },
              child: Text("New Task"),
            ),
          ],
        ),
      ),
    );
  }
}
