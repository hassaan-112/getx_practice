import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm/res/colors/app%20colors.dart';
import 'package:get_x/mvvm/res/components/buttonComponent.dart';

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
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.65,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: homeVM.rxUserList.value.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            homeVM.SelectUser(index);
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      homeVM
                                          .rxUserList
                                          .value
                                          .data![index]
                                          .avatar
                                          .toString(),
                                    ),
                                    radius: Get.width * 0.08,
                                  ),
                                  SizedBox(width: Get.width * 0.05),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Obx(
                  () => ButtonComponent(
                    text: 'Refresh',
                    onPressed: () {
                      homeVM.userList();
                    },
                    isLoading: homeVM.sLoading.value,
                    color: AppColors.black,
                    textColor: AppColors.white,
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
                  : homeVM.error.value == "Time out"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Request time out"),
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
