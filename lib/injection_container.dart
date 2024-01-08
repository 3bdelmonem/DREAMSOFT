import 'package:dreamsoft/features/cart/data/datasources/cart_local_datasource.dart';
import 'package:dreamsoft/features/cart/data/repositories/cart_repository_imp.dart';
import 'package:dreamsoft/features/cart/domain/repositories/cart_repository.dart';
import 'package:dreamsoft/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:dreamsoft/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:dreamsoft/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:dreamsoft/features/cart/presentation/cubit/get_cart_cubit/get_cart_cubit_cubit.dart';
import 'package:dreamsoft/features/home/data/datasource/items_local_data.dart';
import 'package:dreamsoft/features/home/data/repositories/item_repository_implementation.dart';
import 'package:dreamsoft/features/home/domain/usecases/change_favorite.dart';
import 'package:dreamsoft/features/home/domain/usecases/get_all_items.dart';
import 'package:dreamsoft/features/home/presentation/bloc/counter/counter_cubit.dart';
import 'package:dreamsoft/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:dreamsoft/features/layout/presentation/cubit/bnb/bnb_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'features/cart/presentation/cubit/remove_from_cart/remove_from_cart_cubit.dart';
import 'features/home/domain/repositories/item_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Feature => Home

  // cubit
  sl.registerFactory<BnbCubit>(() => BnbCubit());
  sl.registerFactory<HomeBloc>(
      () => HomeBloc(changeFavorite: sl(), getAllItems: sl()));
  sl.registerFactory<CounterCubit>(() => CounterCubit());
  sl.registerFactory<AddToCartCubit>(
      () => AddToCartCubit(addToCartUsecase: sl()));
  sl.registerFactory<GetCartCubitCubit>(
      () => GetCartCubitCubit(getCartUsecase: sl()));
  sl.registerFactory<RemoveFromCartCubit>(
      () => RemoveFromCartCubit(removeFromCartUsecase: sl()));

  // usecases
  sl.registerLazySingleton<GetAllItemsUsecase>(
      () => GetAllItemsUsecase(itemRepository: sl()));
  sl.registerLazySingleton<ChangeFavoriteUsecase>(
      () => ChangeFavoriteUsecase(itemRepository: sl()));
  sl.registerLazySingleton<AddToCartUsecase>(
      () => AddToCartUsecase(cartRepository: sl()));
  sl.registerLazySingleton<GetCartUsecase>(
      () => GetCartUsecase(cartRepository: sl()));
  sl.registerLazySingleton<RemoveFromCartUsecase>(
      () => RemoveFromCartUsecase(cartRepository: sl()));
  // repositories
  sl.registerLazySingleton<ItemRepository>(
      () => ItemRepoitoriesImplementation(itemsLocalDatasource: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepoitoriesImp(cartLocalDatasource: sl()));

  // datasources
  sl.registerLazySingleton<ItemsLocalDatasource>(
      () => ItemsLocalDatasourceImplement(sharedPreferences: sl()));
  sl.registerLazySingleton<CartLocalDatasource>(
      () => CartLocalDatasourceImp(sharedPreferences: sl()));
  //! external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

List<BlocProvider> homeFeatureBlocs(BuildContext context) => [
      BlocProvider<BnbCubit>(create: (BuildContext context) => sl<BnbCubit>()),
      BlocProvider<CounterCubit>(
          create: (BuildContext context) => sl<CounterCubit>()),
      BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              sl<HomeBloc>()..add(GetItemsEvent())),
      BlocProvider<AddToCartCubit>(
          create: (BuildContext context) => sl<AddToCartCubit>()),
      BlocProvider<GetCartCubitCubit>(
          create: (BuildContext context) =>
              sl<GetCartCubitCubit>()..fGetCartItems()),
      BlocProvider<RemoveFromCartCubit>(
          create: (BuildContext context) => sl<RemoveFromCartCubit>()),
    ];
