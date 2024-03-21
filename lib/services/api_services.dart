import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:store/model/products_model.dart';

class ApiServices {
  String productUrl = 'https://fakestoreapi.com/products';

Future<List<ProductsModel>> getProducts() async {
    Response response = await get(Uri.parse(productUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => ProductsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}



final productProvider = Provider<ApiServices>((ref)=>ApiServices());
