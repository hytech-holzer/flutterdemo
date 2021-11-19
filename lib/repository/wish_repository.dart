import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutterdemo/model/wish_model.dart';

abstract class WishRepository {
  Future<List<WishModel>> getWishList();
}

class JsonWishRepository implements WishRepository {
  @override
  Future<List<WishModel>> getWishList() async {
    String jsonString = await rootBundle.loadString('data/wishes.json');
    Iterable jsonArray = json.decode(jsonString);
    List<WishModel> wishList = List<WishModel>.from(
        jsonArray.map((jsonData) => WishModel.fromJson(jsonData)));
    return Future.value(wishList);
  }
}
