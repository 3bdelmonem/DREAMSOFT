import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/domain/repositories/item_repository.dart';

class GetAllItemsUsecase {
  final ItemRepository itemRepository;
  GetAllItemsUsecase({required this.itemRepository});

  Future<Either<Failure, List<Item>>> call() async{
    return await itemRepository.getAllItems();
  }
}
 