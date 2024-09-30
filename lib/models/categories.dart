class Categories {
  final String id;
  final String name;
  final String icon;

  Categories({
    required this.id,
    required this.name,
    required this.icon
});

  factory Categories.fromMap(Map<String, dynamic> data,) {
    return Categories(
      id: data['id'],
      name: data['name'],
      icon: data['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' :id,
      'name' : name,
      'icon' : icon,
    };
  }
}