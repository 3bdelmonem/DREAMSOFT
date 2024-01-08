import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/failures.dart';

import '../../../home/domain/entities/item.dart';

abstract class CartRepository {
  Future<Either<Failure, String>> addToCart({required Item item});
  Future<Either<Failure, List<Item>>> getCartItems();
  Future<Either<Failure, String>> removeFromCart({required Item item});
}
