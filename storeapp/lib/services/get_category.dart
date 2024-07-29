import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class GetCategory {
  Future<List<dynamic>> getAllCategories({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromjson(data[i]));
    }
    return productsList;
  }
}
