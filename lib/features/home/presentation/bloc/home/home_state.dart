part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class LoadingGetItemState extends HomeState {}

final class LoadedGetItemState extends HomeState {
  final List<Item> items;
  const LoadedGetItemState({required this.items});
  @override
  List<Object> get props => [items];
}

final class ErrorGetItemState extends HomeState {
  final String message;
  const ErrorGetItemState({required this.message});
  @override
  List<Object> get props => [message];
}