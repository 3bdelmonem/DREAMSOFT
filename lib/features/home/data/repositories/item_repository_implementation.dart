import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/exceptions.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/data/datasource/items_local_data.dart';
import 'package:dreamsoft/features/home/data/model/item_model.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/domain/repositories/item_repository.dart';

class ItemRepoitoriesImplementation implements ItemRepository {
  final ItemsLocalDatasource itemsLocalDatasource;
  ItemRepoitoriesImplementation({required this.itemsLocalDatasource});

  @override
  Future<Either<Failure, List<Item>>> getAllItems() async {
    try {
      final items = await itemsLocalDatasource.getCachedItems();
      return Right(items);
    } on EmptyCahceException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> changeFavorite(Item item) async {
    final itemModel = ItemModel(
        id: item.id,
        title: item.title,
        description: item.description,
        store: item.store,
        images: item.images,
        price: item.price,
        colors: item.colors,
        sizes: item.sizes,
        rate: item.rate,
        review: item.review,
        available: item.available,
        favorite: item.favorite,
        quntity: item.quntity);
    try {
      await itemsLocalDatasource.cacheItems(itemModel);
      return const Right(unit);
    } on EmptyCahceException {
      return Left(EmptyCacheFailure());
    }
  }
}
