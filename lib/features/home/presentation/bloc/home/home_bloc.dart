import 'package:bloc/bloc.dart';
import 'package:dreamsoft/core/error/failures.dart';
import 'package:dreamsoft/features/home/domain/entities/item.dart';
import 'package:dreamsoft/features/home/domain/usecases/change_favorite.dart';
import 'package:dreamsoft/features/home/domain/usecases/get_all_items.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllItemsUsecase getAllItems;
  final ChangeFavoriteUsecase changeFavorite;
  HomeBloc({required this.getAllItems, required this.changeFavorite}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async{
      if(event is GetItemsEvent){
        emit(LoadingGetItemState());
        final response = await getAllItems();
        response.fold(
          (failure) => emit(ErrorGetItemState(message: failureToMessage(failure))),
          (items) => emit(LoadedGetItemState(items: items))
        );
      }
    });
  }
}
