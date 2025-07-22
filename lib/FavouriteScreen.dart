import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/counterController.dart';

class ItemsScreen extends StatelessWidget {
  ItemsScreen({super.key});
  final FavouriteController favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Items Screen"),),
      body:Column(
        children: [
          Expanded(child: ListView.builder(itemCount: 20, itemBuilder: (context, index) {
            return Obx(()=>ListTile(title: Text("Item $index"),trailing: Icon(favouriteController.favourite.contains(index)?Icons.favorite:Icons.favorite_border),onTap: (){
                  if(favouriteController.favourite.contains(index)){
                    favouriteController.removeFavourite(index);
                  }else{
                    favouriteController.addFavourite(index);
                  }
                print("Item $index");
              },),
            );
          }))
        ],
      )
    );
  }
}

