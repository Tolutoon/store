import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/model/product_model.dart';

List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);

  final itemBagProvider =
      StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
    return ItemBagNotifier();
  });
}
