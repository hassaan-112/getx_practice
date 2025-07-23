import 'package:get/get.dart';

class Task{
  String task;
  bool isCompleted;
  Task({required this.task,required this.isCompleted});
}
class TaskController extends GetxController{

  RxList<Task> tasks = <Task>[].obs;

  addTask(String task){
    tasks.add(Task(task: task, isCompleted: false));
  }
  updateTask(int index){
    tasks[index].isCompleted=!tasks[index].isCompleted;
    tasks.refresh();
  }
  updateT(String task,int index){
    tasks[index].task=task;
    tasks.refresh();
  }
  removeTask(int index){
    tasks.removeAt(index);
  }

}