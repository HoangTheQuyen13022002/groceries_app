class Favorite {
  final String id;
  final String productId;

  Favorite({
    required this.id,
    required this.productId,
  });

  factory Favorite.fromMap(Map<String, dynamic> data, String documentId) {
    return Favorite(
      id: documentId,
      productId: data['productId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' :id,
      'productId': productId,
    };
  }
}
