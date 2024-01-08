part of 'add_to_cart_cubit.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddingToCartState extends AddToCartState {}

final class AddToCartErrorState extends AddToCartState {
  final String message;

  const AddToCartErrorState({required this.message});
}

final class AddToCartSuccessState extends AddToCartState {
  final String message;

  const AddToCartSuccessState({required this.message});
}
