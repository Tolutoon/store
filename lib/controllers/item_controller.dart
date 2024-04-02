import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/model/product_model.dart';

List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);

  // Add new Item
  void addNewItemBag(ProductModel productModel) {
    state = [...state, productModel];
  }

  // Remove Item
  void removeItem(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product
    ];
  }
}

final itemBagProvider =
    StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});
