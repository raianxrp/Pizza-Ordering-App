import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza/common/widgets/loaders/loaders.dart';
import 'package:pizza/features/shop/screens/cart/cart.dart';
import 'package:pizza/utils/local_storage/storage_utility.dart';

import '../../../data/repositories/pizza/pizza_repository.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final pizzaRepository = Get.put(PizzaRepository());

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxList<CartItemModel> addOns = <CartItemModel>[].obs;

  CartController() {
    //loadCartItems();
    getAddOns();
    log(addOns.length.toString());
  }

  addToCart(item) {
    item = CartItemModel.fromJson(item);
    int idx = cartItems.indexWhere(
        (cartItem) => cartItem.id == item.id && cartItem.size == item.size);

    if (idx >= 0) {
      cartItems[idx].amount = item.amount;
    } else {
      cartItems.add(item);
    }

    updateCart();
    MyLoaders.customToast(message: 'Added to Cart!');
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
    addOns.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.amount.toDouble();
      calculatedNoOfItems += item.amount;
    }
    for (var item in addOns) {
      calculatedTotalPrice += (item.price) * item.amount.toDouble();
      calculatedNoOfItems += item.amount;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    LocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = LocalStorage.instance().readData('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(CartItemModel cartItem) {
    final foundItem = cartItems
        .where((item) => item.id == cartItem.id && item.size == cartItem.size)
        .fold(0, (prev_val, element) => prev_val + element.amount);
    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    resetAddOns();
    updateCart();
  }

  void removeFromCartDialog(int idx) {
    Get.defaultDialog(
      title: 'Remove Item',
      middleText: 'Are you sure you want remove this product from the cart?',
      onConfirm: () {
        cartItems.removeAt(idx);
        updateCart();
        MyLoaders.customToast(
          message: "Item Removed from cart",
        );
        Navigator.of(Get.overlayContext!).pop();
      },
      onCancel: () {
        Get.back();
        Get.to(() => CartScreen());
      },
    );
  }

  void addOneToCart(item) {
    int idx = cartItems.indexWhere(
        (cartItem) => cartItem.id == item.id && cartItem.size == item.size);

    cartItems[idx].amount++;

    updateCart();
  }

  void removeOneFromCart(item) {
    int idx = cartItems.indexWhere(
        (cartItem) => cartItem.id == item.id && cartItem.size == item.size);

    if (cartItems[idx].amount > 1) {
      cartItems[idx].amount--;
    } else {
      removeFromCartDialog(idx);
    }

    updateCart();
  }

  void addOnToCart(item) {
    int idx = addOns.indexWhere((addOn) => addOn.id == item.id);

    addOns[idx].amount++;

    updateCart();
  }

  void removeAddOnFromCart(item) {
    int idx = addOns.indexWhere((addOn) => addOn.id == item.id);

    if (addOns[idx].amount > 0) {
      addOns[idx].amount--;
    }

    updateCart();
  }

  resetAddOns() {
    for (final item in addOns) {
      item.amount = 0;
    }
  }

  Future<void> getAddOns() async {
    try {
      final addOn = await pizzaRepository.getAddOns();
      addOns.assignAll(addOn
          .map(
            (e) => CartItemModel(
              id: e.id,
              image: e.image,
              name: e.name,
              price: e.price,
              size: 0,
              amount: 0,
              additionalIngredients: [],
            ),
          )
          .toList());
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
