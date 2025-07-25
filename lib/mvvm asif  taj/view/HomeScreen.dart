import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/response/status.dart';
import '../view model/homeViewModel.dart';
import '../view model/loginViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeVM = Get.put(HomeViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeVM.userList();
  }

  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home_appbar".tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              loginVM.removeUser();
              Get.offAndToNamed("/loginScreen");
            },
            icon: Icon(Icons.logout_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        switch (homeVM.rxStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.COMPLETED:
            return Column(
              children: [
                Text(
                  "total page : ${homeVM.rxUserList.value.total.toString()}",
                ),
                Text(
                  "current page : ${homeVM.rxUserList.value.page.toString()}",
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: homeVM.rxUserList.value.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  homeVM.rxUserList.value.data![index].avatar
                                      .toString(),
                                ),
                                radius: Get.width * 0.08,
                              ),
                              SizedBox(width: Get.width * 0.05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "First name  : ${homeVM.rxUserList.value.data![index].firstName.toString()}",
                                  ),
                                  Text(
                                    "Last name  : ${homeVM.rxUserList.value.data![index].lastName.toString()}",
                                  ),
                                  Text(
                                    "Email          : ${homeVM.rxUserList.value.data![index].email.toString()}",
                                  ),
                                  Text(
                                    "User id        : ${homeVM.rxUserList.value.data![index].id.toString()}",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          case Status.ERROR:
            return Center(
              child: homeVM.error.value == "No Internet"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No Internet"),
                        ElevatedButton(
                          onPressed: () {
                            homeVM.rxStatus.value = Status.LOADING;
                            homeVM.userList();
                          },
                          child: Text("try again"),
                        ),
                      ],
                    )
                  : Text(homeVM.error.value),
            );
        }
      }),
    );
  }
}
