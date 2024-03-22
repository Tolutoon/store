import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/data/product_list.dart';
import 'package:store/model/product_model.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);

  // Method to toggle isSelected property of a product
  void isSelectItem(int pid, int index) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(isSelected: !state[index].isSelected)
        else
          product,
    ];
  }
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
