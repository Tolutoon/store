import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store/constants/themes.dart';
import 'package:store/controllers/item_controller.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tSecondaryColor,
        title: const Text(
          'Cart Page',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.local_mall,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: ListView.builder(
                  itemCount: itemBag.length,
                  itemBuilder: (context, index) => Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(child: Image.asset(itemBag[index].imgUrl)),
                            Expanded(
                                child: Column(
                              children: [
                                Text(itemBag[index].title),
                                Text(itemBag[index].shortDescription),
                                Row(
                                  children: [Text('\$${itemBag[index].price}')],
                                )
                              ],
                            ))
                          ],
                        ),
                      )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
