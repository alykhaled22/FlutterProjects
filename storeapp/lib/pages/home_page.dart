import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/services/get_all_products.dart';
import 'package:storeapp/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.cartPlus))
          ],
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text("New Trend"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 60, bottom: 20),
          child: FutureBuilder<List<dynamic>>(
              future: GetAllProducts().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> products = snapshot.data!;

                  return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.3,
                      crossAxisCount: 2,
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        products: products[index],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
