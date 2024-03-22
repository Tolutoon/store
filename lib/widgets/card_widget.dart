import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/constants/themes.dart';
import 'package:store/controllers/product_controller.dart';
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
