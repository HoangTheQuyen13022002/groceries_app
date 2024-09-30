class Cart {
  final String id;
  final String productId;
  final int quantity;
  final String dateCreated;
  final String uid;

  Cart({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.dateCreated,
    required this.uid,
  });

  factory Cart.fromMap(Map<String, dynamic> data, String documentId) {
    return Cart(
      id: documentId,
      productId: data['productId'],
      quantity: data['quantity'],
      dateCreated: data['dateCreated'],
      uid: data['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' :id,
      'productId': productId,
      'quantity': quantity,
      'dateCreated': dateCreated,
      'uid': uid,
    };
  }
}
