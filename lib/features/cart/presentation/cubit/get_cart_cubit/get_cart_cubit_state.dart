part of 'get_cart_cubit_cubit.dart';

sealed class GetCartCubitState extends Equatable {
  const GetCartCubitState();

  @override
  List<Object> get props => [];
}

final class GetCartCubitInitial extends GetCartCubitState {}

final class GettingCartState extends GetCartCubitState {}

final class GettingCartErrorState extends GetCartCubitState {
  final String message;

  const GettingCartErrorState({required this.message});
}

final class GettingCartSuccessState extends GetCartCubitState {
  final List<Item> cartItems;

  const GettingCartSuccessState({required this.cartItems});
}
