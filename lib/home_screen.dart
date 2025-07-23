// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'controllers/counterController.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GetX",style: GoogleFonts.poppins(),),
//         centerTitle: true,
//       ),
//       body: GetBuilder<CounterController>(builder: (s)=>
//           Column(
//             children: [
//               Card(child: ListTile(title: Text("Dialog"),subtitle: Text("Getx dialog"),onTap: (){
//                 Get.defaultDialog(title: "Default dialog",middleText: "This is default dialog",cancel: TextButton(onPressed: (){
//                   Get.back();
//                 }, child: Text("Cancel")
//                 ),
//                 );
//               },)),
//               Card(child: ListTile(title: Text("Bottom Sheet"),subtitle: Text("Bottom sheet to change theme"),onTap: (){
//                 Get.bottomSheet(
//                     backgroundColor:  Get.theme.brightness==Brightness.dark?Colors.black12:Colors.white,
//                     Container(
//                       child: Column(
//                           children: [
//                             SizedBox(height: 20,),
//                             ListTile(title: Text("Light Theme"),leading: Icon(Icons.light_mode),onTap: (){
//                               Get.changeTheme(ThemeData.light());
//                               Get.back();
//                             }),
//                             ListTile(title: Text("Dark Theme"),leading: Icon(Icons.dark_mode),onTap: (){
//                               Get.changeTheme(ThemeData.dark());
//                               Get.back();
//
//                             }),
//                           ]
//                       ),
//                     ));
//               },)),
//               OutlinedButton(onPressed: (){
//                 s.increment();
//                 // countController.increment();
//               }, child: Text("Increment")),
//
//               Text(s.x.toString())
//             ],
//           ),),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Get.snackbar("Welcome","this is snackbar",snackPosition: SnackPosition.TOP,);
//       },)
//     );
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/FavouriteScreen.dart';
import 'package:get_x/gender%20predictor/screens/NameScreen.dart';
import 'package:get_x/todo%20app/screens/HomeScreen.dart';
import 'package:get_x/widgets/slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/counterController.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController countController = Get.put(CounterController());
  final SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("GetX",style: GoogleFonts.poppins(),),
          centerTitle: true,
        ),
        drawer: Drawer(
          child:SafeArea(
            child: Center(child: Column(
              children: [
                SizedBox(height: 50,),
                Card(child: ListTile(title: Text("To Do list App",),onTap: (){Get.to(()=>THomescreen());},),),
                Card(child: ListTile(title: Text("News app",),onTap: (){Get.to(()=>NewsScreen());},),)],
            )),
          )
        ),
        body: Column(
          children: [
            Card(child: ListTile(title: Text("Dialog"),subtitle: Text("Getx dialog"),onTap: (){
              Get.defaultDialog(title: "Default dialog",middleText: "This is default dialog",cancel: TextButton(onPressed: (){
                Get.back();
              }, child: Text("Cancel")
              ),
              );
            },)),
            Card(child: ListTile(title: Text("Bottom Sheet"),subtitle: Text("Bottom sheet to change theme"),onTap: (){
              Get.bottomSheet(
                  backgroundColor:  Get.theme.brightness==Brightness.dark?Colors.black12:Colors.white,
                  Container(
                    child: Column(
                        children: [
                          SizedBox(height: 20,),
                          ListTile(title: Text("Light Theme"),leading: Icon(Icons.light_mode),onTap: (){
                            Get.changeTheme(ThemeData.light());
                            Get.back();
                          }),
                          ListTile(title: Text("Dark Theme"),leading: Icon(Icons.dark_mode),onTap: (){
                            Get.changeTheme(ThemeData.dark());
                            Get.back();

                          }),
                        ]
                    ),
                  ));
            },)),
            OutlinedButton(onPressed: (){
              countController.increment();
            }, child: Text("Increment")),
            Obx(
              ()=> Visibility(

                visible: countController.x.value==0?false:true,
                 child: Text(countController.x.toString())

              ),
            ),
            SliderW(),
            SliderW(),
            OutlinedButton(onPressed: (){Get.to(ItemsScreen());}, child: Text("NextScreen"))

          ],
        ),
        floatingActionButton: Obx(
            ()=> FloatingActionButton(
          backgroundColor: Colors.red.withValues(alpha:sliderController.slider.value),onPressed: () {
            Get.snackbar("Welcome","this is snackbar",snackPosition: SnackPosition.TOP,);
          },),
        )
    );
  }
}
