import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/data/product_list.dart';
import 'package:store/model/product_model.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
