import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/model/products_model.dart';
import 'package:store/provider/data_provider.dart';

class TestWidget extends ConsumerWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productDataProvider);
    print(products.hasValue);

    return products.when(
      data: (productData) {
        List<ProductsModel> productList = productData.map((e) => e).toList();
        return Container(
          height: 300,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
              childAspectRatio:
                  0.75, // Aspect ratio of grid items (width / height)
            ),
            itemCount: productList.length,
            itemBuilder: (_, index) {
              return Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(productList[index].title.toString()),
                      Text(productList[index].description.toString()),
                      Image.network(productList[index].image.toString()),
                      Text(productList[index].price.toString()),
                    ],
                  ),
                ),
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
