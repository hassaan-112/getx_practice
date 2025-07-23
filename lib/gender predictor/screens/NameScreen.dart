import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/prediction_controller.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  PredictionController predictionController = Get.put(PredictionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prediction Screen")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("press button to fetch data"),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: predictionController.formKey,
              child: TextFormField(
                autofocus: false,

                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
                controller: predictionController.nameController,
                decoration: InputDecoration(hintText: "Enter your name"),
              ),
            ),
          ),
          Obx(
            () => predictionController.is_loading.value
                ? CircularProgressIndicator()
                : OutlinedButton(
                    onPressed: () async {
                      if (predictionController.formKey.currentState!
                          .validate()) {
                        predictionController.getPrediction();
                        predictionController.nameController.clear();
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: Text("Get prediction"),
                  ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Visibility(
              visible: predictionController.data.value.name == null
                  ? false
                  : true,
              child: Column(
                children: [
                  Text(
                    "Name : ${predictionController.data.value.name.toString()}",
                  ),
                  Text(
                    "Predicted gender : ${predictionController.data.value.Gender.toString()}",
                  ),
                  Text(
                    "Probability : ${predictionController.data.value.probability.toString()}",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
