import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/constants/themes.dart';
import 'package:store/controllers/item_controller.dart';
import 'package:store/controllers/product_controller.dart';
import 'package:store/model/product_model.dart';
// import 'package:store/provider/data_provider.dart';

class CardWidget extends ConsumerWidget {
  const CardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productNotifierProvider);
    final itemBag = ref.watch(itemBagProvider);
    // ref.watch(productDataProvider);
    return Container(
      decoration: BoxDecoration(color: tWhiteColor, boxShadow: [
        BoxShadow(
            offset: const Offset(0, 6),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 4)
      ]),
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            color: tLightBackground,
            child: Image.asset(product[productIndex].imgUrl),
          )),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[productIndex].title,
                    style: AppTheme.kCardTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Short decription product',
                    style: AppTheme.tBodyText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product[productIndex].price}',
                        style: AppTheme.kCardTitle,
                      ),
                      IconButton(
                          onPressed: () { 
                            ref
                                .read(productNotifierProvider.notifier)
                                .isSelectItem(
                                    product[productIndex].pid, productIndex);

                            print(product[productIndex].isSelected);
                            print(itemBag.length);

                            if (product[productIndex].isSelected == false) {
                              ref.read(itemBagProvider.notifier).addNewItemBag(
                                  ProductModel(
                                      pid: product[productIndex].pid,
                                      imgUrl: product[productIndex].imgUrl,
                                      title: product[productIndex].title,
                                      price: product[productIndex].price,
                                      shortDescription: product[productIndex]
                                          .shortDescription,
                                      longDescription:
                                          product[productIndex].longDescription,
                                      reviews: product[productIndex].reviews,
                                      rating: product[productIndex].rating));
                            } else {
                              ref
                                  .read(itemBagProvider.notifier)
                                  .removeItem(product[productIndex].pid);
                            }
                          },
                          icon: Icon(
                            product[productIndex].isSelected
                                ? Icons.check_circle
                                : Icons.add_circle,
                            size: 30,
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
