import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/data/data.dart';
import 'package:dreamsoft/core/error/exceptions.dart';
import 'package:dreamsoft/features/home/data/model/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ItemsLocalDatasource {
  Future<List<ItemModel>> getCachedItems();
  Future<Unit> cacheItems(ItemModel itemModel);
}

class ItemsLocalDatasourceImplement implements ItemsLocalDatasource{
  final SharedPreferences sharedPreferences;
  ItemsLocalDatasourceImplement({required this.sharedPreferences});
  
  @override
  Future<Unit> cacheItems(ItemModel itemModel) {
    final jsonString = sharedPreferences.getString("cached_items");
    if(jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ItemModel> jsonToItemModel = decodeJsonData.map<ItemModel>((itemModel) => ItemModel.fromJson(itemModel)).toList();
      int existingIndex =  jsonToItemModel.indexWhere((element) => element.id == itemModel.id);
      jsonToItemModel[existingIndex] = itemModel;
      List itemModelToJson = jsonToItemModel.map<Map<String, dynamic>>((jsonItem) => jsonItem.toJson()).toList();
      sharedPreferences.setString("cached_items", json.encode(itemModelToJson));
      return Future.value(unit);
    }
    else {
      throw EmptyCahceException();
    }
  }

  @override
  Future<List<ItemModel>> getCachedItems() {
    if(sharedPreferences.getString("first") == null){
      sharedPreferences.setString("first", "not first");
      List itemModelToJson = itemsData.map<Map<String, dynamic>>((jsonItem) => jsonItem.toJson()).toList();
      sharedPreferences.setString("cached_items", json.encode(itemModelToJson));
      return Future.value(itemsData);
    }
    else {
      final jsonString = sharedPreferences.getString("cached_items");
      if(jsonString != null) {
        List decodeJsonData = json.decode(jsonString);
        List<ItemModel> jsonToItemModel = decodeJsonData.map<ItemModel>((itemModel) => ItemModel.fromJson(itemModel)).toList();
        return Future.value(jsonToItemModel);
      }
      else {
        throw EmptyCahceException();
      }
    }
  }
}