import 'package:crypta/src/models/card.dart';
import 'package:crypta/src/models/exchange_rate.dart';
import 'package:crypta/src/screens/conversion_screen.dart';
import 'package:flutter/material.dart';
import 'package:crypta/src/blocs/main_bloc/main_state.dart';
import 'package:crypta/src/screens/wallet_screen.dart';
import 'package:crypta/src/screens/exchange_screen.dart';

class MainCubitHelper {
  Widget mainWidget(MainState state, ExchangeRate exchangeRate, List<CardModel> cards) {
    Widget widget;
    switch(state.toString()){
      case('WalletScreenState'):
        {
          widget = WalletScreen(cards);
          return widget;
        }
        break;
      case('ExchangeScreenState'):
        {
          widget = ExchangeScreen(exchangeRate, cards);
          return widget;
        }
        break;
      case('ConversionScreenState'):
        {
          widget = ConversionScreen(cards, exchangeRate);
          return widget;
        }
        break;
      case('LoadingState'):
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        break;
      default: {
        return Container();
      }
      break;
    }
  }
}