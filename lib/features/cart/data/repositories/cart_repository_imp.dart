import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';

import '../../../../core/error/exceptions.dart';
import '../../../home/data/model/item_model.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_local_datasource.dart';

class CartRepoitoriesImp implements CartRepository {
  final CartLocalDatasource cartLocalDatasource;

  CartRepoitoriesImp({required this.cartLocalDatasource});

  @override
  Future<Either<Failure, String>> addToCart({required Item item}) async {
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
      final message = await cartLocalDatasource.addToCart(item: itemModel);
      return Right(message);
    } on EmptyCahceException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Item>>> getCartItems() async {
    try {
      final response = await cartLocalDatasource.getCartItems();
      return Right(response);
    } on EmptyCahceException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> removeFromCart({required Item item}) async {
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
      final message = await cartLocalDatasource.removeFromCart(item: itemModel);
      return Right(message);
    } on EmptyCahceException {
      return Left(EmptyCacheFailure());
    }
  }
}
