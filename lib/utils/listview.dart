import 'package:flutter/material.dart';
import 'package:untitled1/model/cart_product_model.dart';
import 'package:untitled1/utils/utils.dart';
import 'package:untitled1/viewModel/cart_event.dart';
import 'package:untitled1/viewModel/cart_viewModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatefulWidget {
  final String searchName;
  const ProductListView({super.key, required this.searchName});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  // Initial product list
  final List<CartProductModel> allProducts = [
    CartProductModel('Apple', 100, 1, 1),
    CartProductModel('Banana', 200, 1, 1),
    CartProductModel('Carrot', 300, 1, 1),
  ];

  // This will hold the filtered list of products
  List<CartProductModel> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // Initially show all products
    filteredProducts = allProducts;
  }

  @override
  void didUpdateWidget(ProductListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    filterProducts(widget.searchName);
  }

  void filterProducts(String searchName) {
    setState(() {
      if (searchName.isEmpty) {
        filteredProducts = allProducts;
      } else {
        filteredProducts = allProducts
            .where((product) => product.productName
            .toLowerCase()
            .startsWith(searchName.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return ProductContainer(
          productName: product.productName,
          price: product.productPrice,
          weight: product.productWeight,
          addToCart: () {
            context.read<CartViewModel>().add(AddProductEvent(product));
          },
        );
      },
    );
  }
}
