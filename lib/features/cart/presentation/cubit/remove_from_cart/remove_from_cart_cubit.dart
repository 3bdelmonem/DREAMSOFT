import 'package:bloc/bloc.dart';
import 'package:dreamsoft/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:dreamsoft/features/cart/presentation/cubit/get_cart_cubit/get_cart_cubit_cubit.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../injection_container.dart';
import '../../../../home/domain/entities/item.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  final RemoveFromCartUsecase removeFromCartUsecase;
  RemoveFromCartCubit({required this.removeFromCartUsecase})
      : super(RemoveFromCartInitial());
  void fRemoveItemFromCart(Item item) async {
    emit(RemovingFromCartState());
    final response = await removeFromCartUsecase(item);
    response.fold(
        (failure) => emit(
            RemovingFromCartErrorState(message: failureToMessage(failure))),
        (success) {
      sl<GetCartCubitCubit>().fGetCartItems();
      emit(RemovingFromCartSuccessState(message: (success)));
    });
  }
}
