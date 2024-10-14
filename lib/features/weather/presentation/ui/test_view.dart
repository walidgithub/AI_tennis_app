import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:permission_handler/permission_handler.dart';
import 'package:network_info_plus/network_info_plus.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  gettingIP() async {
    await Permission.location.request();
    final info = NetworkInfo();
    var hostAddress = await info.getWifiIP();
    print(hostAddress);
    return hostAddress;
  }

  static Future<String?> getIPAddress() async {
    try {
      final url = Uri.parse('http://api.ipify.org');
      final response = await http.get(url);
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      return null;
    }
  }

  // Define the method to get the prediction
  Future<void> getPrediction(List<int> features) async {
    final ipAddress = await getIPAddress();
    print(ipAddress);
    await gettingIP();
    final url = Uri.parse('http://10.0.2.2:5001/predict');

    // Create the POST request body
    Map<String, dynamic> body = {'features': features};

    // Send the POST request
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
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
              IconButton(
                onPressed: () {
                  //- outlook is rainy (the value is 0 for no and 1 for yes)
                  // - outlook is sunny (the value is 0 for no and 1 for yes)
                  // - temperature is hot (the value is 0 for no and 1 for yes)
                  // - temperature is mild (the value is 0 for no and 1 for yes)
                  // - humidity is normal (the value is 0 for no and 1 for yes)
                  List<int> features_0 = [0, 1, 1, 0, 0]; // Prediction: [0]
                  List<int> features_1 = [0, 1, 0, 1, 1]; // Prediction: [1]
                  getPrediction(
                      features_1); // Call getPrediction with the feature list
                },
                icon: const Icon(
                  Icons.get_app_sharp,
                  size: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
