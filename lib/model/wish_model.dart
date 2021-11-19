class WishModel {
  final String id;
  final String name;
  final String? price;

  WishModel({required this.id, required this.name, this.price});

  factory WishModel.fromJson(Map<String, dynamic> json) {
    return WishModel(id: json["id"], name: json["name"], price: json["price"]);
  }
}
