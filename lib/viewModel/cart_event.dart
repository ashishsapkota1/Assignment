import 'package:untitled1/model/cart_product_model.dart';

abstract class CartEvent{}

class AddProductEvent extends CartEvent{
  final CartProductModel cartProduct;
  AddProductEvent(this.cartProduct);
}

class RemoveProductEvent extends CartEvent{
  final CartProductModel cartProduct;
  RemoveProductEvent(this.cartProduct);
}

class IncreaseQuantity extends CartEvent{
  final String productName;
  IncreaseQuantity(this.productName);
}

class DecreaseQuantity extends CartEvent{
  final String productName;
  DecreaseQuantity(this.productName);
}
