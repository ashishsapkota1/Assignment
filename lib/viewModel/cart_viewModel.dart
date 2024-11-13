import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/cart_product_model.dart';
import 'package:untitled1/viewModel/cart_event.dart';

class CartViewModel extends Bloc<CartEvent, List<CartProductModel>> {
  CartViewModel() : super([]) {
    on<AddProductEvent>((event, emit) {
      final updatedCart = List<CartProductModel>.from(state);
      final existingProduct = updatedCart.indexWhere(
          (item) => item.productName == event.cartProduct.productName);

      if (existingProduct >= 0) {
        updatedCart[existingProduct].quantity += event.cartProduct.quantity;
      } else {
        updatedCart.add(event.cartProduct);
      }

      emit(updatedCart);
    });

    on<RemoveProductEvent>((event, emit) {
      final updatedCart = List<CartProductModel>.from(state);
      updatedCart.removeWhere(
          (item) => item.productName == event.cartProduct.productName);

      emit(updatedCart);
    });

    on<IncreaseQuantity>((event, emit) {
      final updatedCart = List<CartProductModel>.from(state);
      final productIndex = updatedCart
          .indexWhere((item) => item.productName == event.productName);

      if (productIndex >= 0) {
        updatedCart[productIndex].quantity++;
        emit(updatedCart);
      }
    });

    on<DecreaseQuantity>((event, emit) {
      final updatedCart = List<CartProductModel>.from(state);
      final productIndex = updatedCart
          .indexWhere((item) => item.productName == event.productName);

      if (productIndex >= 0) {
        if (updatedCart[productIndex].quantity > 1) {
          updatedCart[productIndex].quantity--;
        }
        emit(updatedCart);
      }
    });

    on<SearchProductEvent>((event, emit) {
      final allCartProduct = List<CartProductModel>.from(state);
      if (event.name.isEmpty) {
        emit(allCartProduct);
      } else {
        final filteredProduct = allCartProduct
            .where((product) => product.productName == event.name)
            .toList();
        emit(filteredProduct);
      }
    });
  }
}
