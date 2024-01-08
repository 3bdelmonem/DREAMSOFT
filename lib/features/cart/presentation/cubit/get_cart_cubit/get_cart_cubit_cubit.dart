import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dreamsoft/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';

part 'get_cart_cubit_state.dart';

class GetCartCubitCubit extends Cubit<GetCartCubitState> {
  final GetCartUsecase getCartUsecase;

  GetCartCubitCubit({required this.getCartUsecase})
      : super(GetCartCubitInitial());
  int totalItems = 0;
  double totalAmount = 0;
  List<Item> cartList = [];
  void fGetCartItems() async {
    emit(GettingCartState());
    final response = await getCartUsecase();
    response.fold(
        (failure) =>
            emit(GettingCartErrorState(message: failureToMessage(failure))),
        (success) {
      totalAmount = 0;
      for (var element in success) {
        totalAmount += double.parse(element.price) * element.quntity;
      }
      cartList = success;
      log(success.toString());
      totalItems = success.length;

      emit(GettingCartSuccessState(cartItems: (success)));
    });
  }
}
