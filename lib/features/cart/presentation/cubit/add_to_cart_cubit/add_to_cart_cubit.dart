import 'package:bloc/bloc.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:equatable/equatable.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUsecase addToCartUsecase;
  AddToCartCubit({required this.addToCartUsecase}) : super(AddToCartInitial());
  void fAddItemToCart(Item item) async {
    emit(AddingToCartState());
    final response = await addToCartUsecase(item);
    response.fold(
        (failure) =>
            emit(AddToCartErrorState(message: failureToMessage(failure))),
        (success) {
      emit(AddToCartSuccessState(message: (success)));
    });
  }
}
