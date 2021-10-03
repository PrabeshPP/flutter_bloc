import 'dart:convert';

class ItemModel {
  static List<Items>? item;
}

class Items {
  final String name;
  final String price;
  final String img;

  Items({
    required this.name,
    required this.price,
    required this.img,
  });

  Items copyWith({
    String? name,
    String? price,
    String? img,
  }) {
    return Items(
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'img': img,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'],
      price: map['price'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() => 'Items(name: $name, price: $price, img: $img)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Items &&
      other.name == name &&
      other.price == price &&
      other.img == img;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ img.hashCode;
}
