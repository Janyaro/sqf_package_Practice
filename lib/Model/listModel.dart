class ListData {
  final String? title;
  final String? description;
  final String? Owner;
  final int? weight;
  final int? price;

  ListData({
    required this.title,
    required this.description,
    required this.Owner,
    required this.weight,
    required this.price,
  });

  ListData.fromMap(Map<dynamic, dynamic> res)
      : title = res['title'],
        description = res['description'],
        Owner = res['Owner'],
        weight = res['weight'],
        price = res['price'];

  Map<String, Object?> toMap() {
    return {
      'title ': title,
      'description': description,
      'Owner': Owner,
      'weight': weight,
      'price': price
    };
  }
}
