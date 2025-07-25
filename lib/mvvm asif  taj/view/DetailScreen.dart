import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view model/homeViewModel.dart';
class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVM = Get.put(HomeViewModel());
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
        centerTitle: true,
      ),
      body: Column(

        children: [
          Center(
            child: Container(
              height: Get.height*.5,
              width: Get.width*0.8,
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){homeVM.removeUser();
                        }, icon: Icon(Icons.delete))
                    ],),
                  SizedBox(height: Get.height*.02,),
                  CircleAvatar(radius: Get.width*0.2,backgroundImage: NetworkImage(homeVM.rxUserList.value.data![homeVM.selectedUser.value].avatar.toString()),),
                  SizedBox(height: Get.height*.02,),
                  Text(homeVM.rxUserList.value.data![homeVM.selectedUser.value].firstName.toString(),style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: Get.height*.02,),
                  Text(homeVM.rxUserList.value.data![homeVM.selectedUser.value].lastName.toString(),style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: Get.height*.02,),
                  Text(homeVM.rxUserList.value.data![homeVM.selectedUser.value].email.toString(),style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: Get.height*.02,),
                  Text("ID :${homeVM.rxUserList.value.data![homeVM.selectedUser.value].id.toString()}",style: Theme.of(context).textTheme.titleLarge,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
