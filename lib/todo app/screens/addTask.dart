import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/todo%20app/controllers/TaskController.dart';

dialog (String? text, bool state, int ?index){
  // bool state=false;
  TextEditingController taskController = TextEditingController();
  if(text!=null){ taskController.text=text;}
  final TaskController  tc = Get.put(TaskController());
  final formKey = GlobalKey<FormState>();
  Get.defaultDialog(
    contentPadding: EdgeInsets.all(20),
    title: "Add Task",
    content: Column(
      children: [
        Form(
            key: formKey,
            child: Column(
          children: [
            TextFormField(

              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a task";
                }
                return null;
              },autofocus: true,
              controller: taskController,
              decoration: InputDecoration(
                hintText: "Task",
              ),
            ),
          ],
        ))
      ],
    ),
    confirm: OutlinedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Get.back();
          if(state){
            tc.updateT(taskController.text,index!);
            print("update");
          }
          else{

          tc.addTask(taskController.text);
          }
        }
      },
      child: Text(state?"Update Task":"Add Task"),
    ),
  );
}