import 'package:bloc/bloc.dart';
part 'bnb_state.dart';

class BnbCubit extends Cubit<BnbState> {
  BnbCubit() : super(BnbState(bnbIndex: 0));
  void changeIndex({required int currentIndex}) {
    emit(BnbState(bnbIndex: currentIndex));
  }
}
