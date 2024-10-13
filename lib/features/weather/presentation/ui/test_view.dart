import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  // Define the method to get the prediction
  Future<void> getPrediction(List<int> features) async {
    final url = Uri.parse('http://10.0.2.2:5001/predict');

    // Create the POST request body
    Map<String, dynamic> body = {
      'features': features
    };

    print(body);

    // Send the POST request
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    print(response);
    // Handle the response
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      if (kDebugMode) {
        print('Prediction: $prediction');
      }
    } else {
      if (kDebugMode) {
        print('Failed to get Prediction');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              IconButton(onPressed: () {
                //- outlook is rainy (the value is 0 for no and 1 for yes)
                // - outlook is sunny (the value is 0 for no and 1 for yes)
                // - temperature is hot (the value is 0 for no and 1 for yes)
                // - temperature is mild (the value is 0 for no and 1 for yes)
                // - humidity is normal (the value is 0 for no and 1 for yes)
                List<int> features_0 = [0,1,1,0,0];  // Prediction: [0]
                List<int> features_1 = [0,1,0,1,1];  // Prediction: [1]
                getPrediction(features_1);  // Call getPrediction with the feature list
              }, icon: const Icon(Icons.get_app_sharp,size: 50,),),
            ],
          )


        ],),
    );
  }
}
