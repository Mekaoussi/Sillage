import 'package:flutter/foundation.dart';
import '../depend/fetched_data_model.dart';
import '../myservices/product_service.dart';

class ProductProvider extends ChangeNotifier {
  FetchedDataModel? _productData;

  FetchedDataModel? get productData => _productData;

  

  Future<void> fetchProductData() async {
    _productData = await ProductService().fetchProductData();
    notifyListeners();
  }
}
