class Product {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final String nutrients;
  final double price;
  final String unit;
  final double star;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.nutrients,
    required this.price,
    required this.unit,
    required this.star,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      nutrients: data['nutrients'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      unit: data['unit'] ?? '',
      star: (data['star'] ?? 0).toDouble(),
      category: data['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'nutrients': nutrients,
      'price': price,
      'unit': unit,
      'star': star,
      'category': category,
    };
  }
}
