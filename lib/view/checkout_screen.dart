import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/utils/utils.dart';
import 'package:untitled1/viewModel/cart_event.dart';
import '../model/cart_product_model.dart';
import '../viewModel/cart_viewModel.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return BlocBuilder<CartViewModel, List<CartProductModel>>(
      builder: (context, cartItems) {
        double totalAmount = cartItems.fold(0.0, (previousValue, item) {
          return previousValue + (item.productPrice * item.quantity);
        });
        if (cartItems.isEmpty) {
          return const Center(
            child: Text(
              'Add products to cart',
              style: TextStyle(color: AppColor.containerColor, fontSize: 20),
            ),
          );
        }

        return SafeArea(
          bottom: true,
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Container(
                      height: 80,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColor.addColor,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColor.textColor,
                                blurRadius: 1,
                                spreadRadius: 1)
                          ]),
                      child: Row(
                        children: [
                          horizontalSpacing(space: 8),
                          Container(
                              height: 60,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
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
                          horizontalSpacing(space: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.productName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CartViewModel>().add(
                                          DecreaseQuantity(item.productName));
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppColor.containerColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        Icons.remove,
                                        color: AppColor.whiteColor,
                                      )),
                                    ),
                                  ),
                                  horizontalSpacing(space: 8),
                                  Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  horizontalSpacing(space: 8),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CartViewModel>().add(
                                          IncreaseQuantity(item.productName));
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppColor.containerColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        Icons.add,
                                        color: AppColor.whiteColor,
                                      )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          horizontalSpacing(space: 50),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<CartViewModel>()
                                      .add(RemoveProductEvent(item));
                                },
                                child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: AppColor.whiteColor,
                                      size: 20,
                                    ))),
                              ),
                              Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColor.containerColor),
                                  ),
                                  child: Center(
                                      child: Text(
                                    item.productPrice.toString(),
                                    style: const TextStyle(
                                        color: AppColor.containerColor),
                                  ))),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
                verticalSpacing(space: 8),
                Container(
                  height: 50,
                  width: responsive.screenWidth * 0.9,
                  decoration: BoxDecoration(
                      color: AppColor.addColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Total -',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor),
                      ),
                      Text(
                        totalAmount.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                verticalSpacing(space: 30),
                Container(
                  height: 50,
                  width: responsive.screenWidth * 0.9,
                  decoration: BoxDecoration(
                      color: AppColor.containerColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.whiteColor),
                          child: const Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: AppColor.containerColor,
                          )),
                      horizontalSpacing(space: 8),
                      const Text(
                        "CHECKOUT",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
