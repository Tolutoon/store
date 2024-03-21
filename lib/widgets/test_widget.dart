import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/model/products_model.dart';
import 'package:store/provider/data_provider.dart';

class TestWidget extends ConsumerWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productDataProvider);

    return products.when(
      data: (productData) {
        List<ProductsModel> productList = productData.map((e) => e).toList();
        return Container(
          height: 100,
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (_, index) {
              return Card(
                child: Column(
                  children: [
                    Text(productList[index].title.toString()),
                    Text(productList[index].description.toString())
                  ],
                ), // Removed unnecessary $ sign
              );
            },
          ),
        );
      },
      error: (error, s) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
