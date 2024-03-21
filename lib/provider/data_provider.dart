import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/model/products_model.dart';
import 'package:store/services/api_services.dart';

final productDataProvider = FutureProvider<List<ProductsModel>>((ref) async {
  return ref.watch(productProvider).getProducts();
});
