import 'package:flutter/material.dart';
import 'package:untitled1/utils/utils.dart';

class ProductContainer extends StatelessWidget {
  final String productName;
  final double weight;
  final double price;
  final VoidCallback addToCart;

  const ProductContainer(
      {super.key,
      required this.productName,
      required this.price,
      required this.weight,
      required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart();
        ToastMessage.toastMessage();

      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                  color: AppColor.textColor, blurRadius: 1, spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColor.addColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: AppColor.homeScreenColor,
                          blurRadius: 1,
                          spreadRadius: 1),
                      BoxShadow(
                          color: AppColor.homeScreenColor,
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: const Icon(Icons.app_blocking)),
            Text(
              productName,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: AppColor.priceColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text('Nrs ${price.toString()} Kg',
                        style: const TextStyle(color: AppColor.whiteColor)))),
            Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: AppColor.containerColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Text(
                  '${weight.toString()} Kg',
                  style: const TextStyle(color: AppColor.whiteColor),
                )))
          ],
        ),
      ),
    );
  }
}
