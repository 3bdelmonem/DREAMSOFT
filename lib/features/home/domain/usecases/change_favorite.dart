import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/domain/repositories/item_repository.dart';

class ChangeFavoriteUsecase {
  final ItemRepository itemRepository;
  ChangeFavoriteUsecase({required this.itemRepository});

  Future<Either<Failure, Unit>> call(Item item) async{
    return await itemRepository.changeFavorite(item);
  }
}