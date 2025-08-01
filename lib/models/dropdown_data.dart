class DropdownData {
  // Dummy data for dropdowns
  final List<String> categories1 = [
    'Electronics',
    'Computers',
    'Smartphones',
    'Tablets',
    'Accessories'
  ];

  final List<String> categories2 = [
    'Clothing',
    'Shirts',
    'Pants',
    'Shoes',
    'Accessories'
  ];

  final List<String> categories3 = [
    'Books',
    'Fiction',
    'Non-Fiction',
    'Textbooks',
    'Comics'
  ];

  final List<String> categories4 = [
    'Food',
    'Fruits',
    'Vegetables',
    'Snacks',
    'Beverages'
  ];

  final List<String> categories5 = [
    'Sports',
    'Football',
    'Basketball',
    'Tennis',
    'Swimming'
  ];

  final List<String> categories6 = [
    'Home',
    'Furniture',
    'Appliances',
    'Decor',
    'Tools'
  ];
}

class TableDataModel {
  final String id;
  final String name;
  final String price;
  final String stock;

  TableDataModel({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  Map<String, String> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
    };
  }
}
