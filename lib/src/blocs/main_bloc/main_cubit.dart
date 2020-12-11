import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(WalletScreenState());

  Future<void> toWalletScreen() async {
    emit(WalletScreenState());
  }

  Future<void> toExchangeScreen() async {
    emit(ExchangeScreenState());
  }

  Future<void> toConversionScreen() async {
    emit(ConversionScreenState());
  }
}
