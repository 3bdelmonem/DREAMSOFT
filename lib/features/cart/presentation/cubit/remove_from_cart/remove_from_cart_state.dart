part of 'remove_from_cart_cubit.dart';

sealed class RemoveFromCartState extends Equatable {
  const RemoveFromCartState();

  @override
  List<Object> get props => [];
}

final class RemoveFromCartInitial extends RemoveFromCartState {}

final class RemovingFromCartState extends RemoveFromCartState {}

final class RemovingFromCartErrorState extends RemoveFromCartState {
  final String message;

  const RemovingFromCartErrorState({required this.message});
}

final class RemovingFromCartSuccessState extends RemoveFromCartState {
  final String message;

  const RemovingFromCartSuccessState({required this.message});
}
