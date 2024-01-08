import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
  
abstract class ItemRepository {
  Future<Either<Failure, List<Item>>> getAllItems();
  Future<Either<Failure, Unit>> changeFavorite(Item item);
}