import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';

import '../repositories/cart_repository.dart';

class GetCartUsecase {
  final CartRepository cartRepository;
  GetCartUsecase({required this.cartRepository});

  Future<Either<Failure, List<Item>>> call() async {
    return await cartRepository.getCartItems();
  }
}
