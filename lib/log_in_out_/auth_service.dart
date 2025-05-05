import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

const storage = FlutterSecureStorage();

class AuthService {
  Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }

  Future<void> storeToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  Future<void> removeToken() async {
    await storage.delete(key: 'auth_token');
  }

  Future<bool> signupcall(String name, String email, String pw) async {
  
    const String apiUrl = '$BASE_URL/api/signup';

    // Prepare the data to be sent
    final Map<String, String> data = {
      'name': name,
      'email': email,
      'password': pw,
    };

    
    final String jsonData = jsonEncode(data);

    
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    // Handle the response
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      // Success! Parse the JSON response
      print('Success');
      storeToken(responseData['token']);
      return true;
      // ignore: dead_code
      // Print the response data
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return false;
      // Error!
      // ignore: dead_code
    }
  }

  Future<bool> logincall(String email, String pw) async {
    // Replace with the actual API URL provided by your friend
    const String apiUrl = '$BASE_URL/api/login';

    // Prepare the data to be sent
    final Map<String, String> data = {
      'email': email,
      'password': pw,
    };

    // Encode the data in JSON format
    final String jsonData = jsonEncode(data);

    // Create the HTTP request
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    // Handle the response
    if (response.statusCode == 200) {
      // Success! Parse the JSON response
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      //print('Success: $responseData');
      storeToken(responseData['token']);
      //print(getToken());
      print("suc");
      return true; // Print the response data
    } else {
      // Error!
      print('Error: ${response.statusCode} - ${response.body}');
      return false;
    }
  }

  Future<http.Response> makeAuthenticatedGetRequest(String endpoint) async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$BASE_URL/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true',
      },
    );
    return response;
  }

  Future<http.Response> makeAuthenticatedPostRequest(
      String endpoint, Map<String, String> data) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$BASE_URL/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true',
      },
      body: data,
    );
    return response;
  }
}
