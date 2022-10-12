
import 'package:sample_app_getx/data/models/categories/category_response.dart';

class ProductsResponse {
  List<Products> products = [];
  String? count;

  ProductsResponse({this.products = const [], this.count});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products'] = this.products.map((v) => v.toJson()).toList();
    data['count'] = this.count;
    return data;
  }
}
