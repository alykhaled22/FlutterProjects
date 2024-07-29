import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/helper/show_snack_bar.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = "updateProductPage";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "Update Product",
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  text: productName ?? productModel.title,
                  label: "Product title",
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  text: price ?? productModel.price.toString(),
                  inputType: TextInputType.number,
                  label: "Product price",
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  maxLines: 4,
                  text: desc ?? productModel.description,
                  label: "Product description",
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  text: image ?? productModel.image,
                  label: "Product image URL",
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await UpdateProduct().updateProduct(
                        id: productModel.id.toString(),
                        title: productName ?? productModel.title,
                        price: price ?? productModel.price.toString(),
                        desc: desc ?? productModel.description,
                        image: image ?? productModel.image,
                        category: productModel.category,
                      );
                      showSncakBar(context, "Product is successfully updated");
                    } catch (e) {
                      print(e);
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  text: "Update",
                  width: double.infinity,
                  hight: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
