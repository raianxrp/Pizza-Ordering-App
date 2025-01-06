// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {
  String id;
  String image;
  String name;
  double price;
  int size;
  int amount;
  List additionalIngredients;
  Map<String, String>? selectedVarient;

  CartItemModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.size,
      required this.amount,
      required this.additionalIngredients,
      this.selectedVarient});

  static CartItemModel empty() => CartItemModel(
      id: '',
      image: '',
      name: '',
      price: 0,
      size: 0,
      amount: 0,
      additionalIngredients: []);

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Name': name,
      'Price': price,
      'Size': size,
      'Amount': amount,
      'AdditionalIngredients': [],
      'SelectedVarient': selectedVarient
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> document) {
    if (document.isEmpty) return CartItemModel.empty();
    return CartItemModel(
        id: document['Id'],
        image: document['Image'],
        name: document['Name'],
        price: document['Price'],
        size: document['Size'],
        amount: document['Amount'],
        additionalIngredients: document['AdditionalIngredients'],
        selectedVarient: document['SelectedVarient'] != null
            ? Map<String, String>.from(document['SelectedVarient'])
            : null);
  }
}
