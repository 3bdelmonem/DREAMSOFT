import 'package:dartz/dartz.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';

import '../repositories/cart_repository.dart';

class AddToCartUsecase {
  final CartRepository cartRepository;
  AddToCartUsecase({required this.cartRepository});

  Future<Either<Failure, String>> call(Item item) async {
    return await cartRepository.addToCart(item: item);
  }
}
