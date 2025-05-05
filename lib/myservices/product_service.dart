import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seanotes/log_in_out_/auth_service.dart';
import 'package:seanotes/log_in_out_/config.dart';
import '../depend/fetched_data_model.dart';

class ProductService {
  Future<FetchedDataModel> fetchProductData() async {
    AuthService authService = AuthService();
    final token = await authService.getToken();
    final response = await http.get(
      Uri.parse(
          // 'https://chimp-outgoing-steadily.ngrok-free.app/api/products/homeApp/20/8/50/50/50/50'));
          '$BASE_URL/api/products/homeApp/4/2/50/50/50/50'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return FetchedDataModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load product data');
    }
  }
}
