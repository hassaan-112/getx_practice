// import 'package:get/get.dart';
//
// class CounterController extends GetxController{
//
//   static CounterController get to => Get.find();
//   int x =0;
//
//
//   increment(){
//     x++;
//     update();
//
//   }
//
// }


import 'package:get/get.dart';

class CounterController extends GetxController{

  RxInt x =0.obs;


  increment(){
    x.value++;
  }

}

class SliderController extends GetxController{

  RxDouble slider=0.5.obs;

  changeSlider(double value){
    slider.value=value;
  }

}

class FavouriteController extends GetxController{
  RxList<int> favourite = <int>[].obs;
  addFavourite(int index){
    favourite.add(index);
  }
  removeFavourite(int index){
    favourite.remove(index);}
}