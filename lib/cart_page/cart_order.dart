import 'package:http/http.dart' as http;
import 'package:seanotes/log_in_out_/auth_service.dart';
import 'dart:convert';

import 'package:seanotes/log_in_out_/config.dart';

Future<String> sendOrder(List<Map<String, int>> order) async {
  AuthService authService = AuthService();
  final token = await authService.getToken();
  // Replace with the actual API URL provided by your friend
  const String apiUrl = '$BASE_URL/api/flutter/order';

  // Encode the data in JSON format
  final String jsonData = jsonEncode({"items": order});

  // Create the HTTP request
  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'ngrok-skip-browser-warning': 'true',
    },
    body: jsonData,
  );

  // Handle the response
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return "Failed";
  }
}
