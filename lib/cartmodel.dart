import 'dart:convert';

class ItemModel {
  static List<Items>? item;
}

class Items {
  final String name;
  final String price;

  Items({
    required this.name,
    required this.price,
  });

  Items copyWith({
    String? name,
    String? price,
  }) {
    return Items(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() => 'Items(name: $name, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Items && other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
