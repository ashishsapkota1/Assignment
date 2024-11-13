class CartProductModel{
  final String productName;
  final double productWeight;
  final double productPrice;
  int quantity = 1;

  CartProductModel(this.productName, this.productPrice,this.productWeight, this.quantity);

}