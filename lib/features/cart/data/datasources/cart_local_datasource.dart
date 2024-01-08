import 'dart:convert';

import 'package:dreamsoft/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/data/model/item_model.dart';

abstract class CartLocalDatasource {
  Future<String> addToCart({required ItemModel item});
  Future<List<ItemModel>> getCartItems();
  Future<String> removeFromCart({required ItemModel item});
}

class CartLocalDatasourceImp implements CartLocalDatasource {
  final SharedPreferences sharedPreferences;
  CartLocalDatasourceImp({required this.sharedPreferences});

  @override
  Future<String> addToCart({required ItemModel item}) {
    final jsonString = sharedPreferences.getString("cart");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ItemModel> jsonToItemModel = decodeJsonData
          .map<ItemModel>((itemModel) => ItemModel.fromJson(itemModel))
          .toList();
      int existingIndex =
          jsonToItemModel.indexWhere((element) => element.id == item.id);
      if (existingIndex >= 0) {
        jsonToItemModel[existingIndex] = item;
      } else {
        jsonToItemModel.add(item);
      }
      List itemModelToJson = jsonToItemModel
          .map<Map<String, dynamic>>((jsonItem) => jsonItem.toJson())
          .toList();
      sharedPreferences.setString("cart", json.encode(itemModelToJson));
      return Future.value("Success");
    } else {
      List<ItemModel> jsonToItemModel = [];
      List itemModelToJson = jsonToItemModel
          .map<Map<String, dynamic>>((jsonItem) => jsonItem.toJson())
          .toList();
      sharedPreferences.setString("cart", json.encode(itemModelToJson));
      return Future.value("Success");
    }
  }

  @override
  Future<List<ItemModel>> getCartItems() {
    final jsonString = sharedPreferences.getString("cart");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ItemModel> jsonToItemModel = decodeJsonData
          .map<ItemModel>((itemModel) => ItemModel.fromJson(itemModel))
          .toList();
      return Future.value(jsonToItemModel);
    } else {
      throw EmptyCahceException();
    }
  }

  @override
  Future<String> removeFromCart({required ItemModel item}) {
    final jsonString = sharedPreferences.getString("cart");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ItemModel> jsonToItemModel = decodeJsonData
          .map<ItemModel>((itemModel) => ItemModel.fromJson(itemModel))
          .toList();
      int existingIndex =
          jsonToItemModel.indexWhere((element) => element.id == item.id);
      if (existingIndex >= 0) {
        jsonToItemModel.removeAt(existingIndex);
      }
      List itemModelToJson = jsonToItemModel
          .map<Map<String, dynamic>>((jsonItem) => jsonItem.toJson())
          .toList();
      sharedPreferences.setString("cart", json.encode(itemModelToJson));
      return Future.value("Success");
    } else {
      throw EmptyCahceException();
    }
  }
}
