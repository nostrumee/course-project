import 'package:crypta/src/models/card.dart';
import 'package:crypta/src/models/exchange_rate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypta/src/blocs/main_bloc/main_cubit.dart';
import 'package:crypta/src/blocs/main_bloc/main_cubit_helper.dart';
import 'package:crypta/src/blocs/main_bloc/main_state.dart';
import 'package:flutter_svg/svg.dart';

class MainForm extends StatefulWidget {
  MainForm({Key key}) : super(key: key);

  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  MainCubit _mainCubit;
  MainCubitHelper _helper;

  ExchangeRate exchangeRate;
  List<CardModel> cards = List();

  @override
  void initState() {
    super.initState();
    _mainCubit = BlocProvider.of<MainCubit>(context);
    _helper = MainCubitHelper();
    getExchangeRate();
    cards.add(CardModel(17, 3741, "Eduard Klygunov", "BTC"));
    cards.add(CardModel(213, 9227, "Eduard Klygunov", "ETH"));
  }

  void getExchangeRate() async {
    Response response;
    ExchangeRate exchangeRates;
    Dio dio = new Dio();
    dio.options.headers["content-encoding"] = "gzip";
    dio.options.headers["content-type"] = "application/json";
    dio.options.headers["date"] = "Wed, 02 Dec 2020 19:33:34 GMT";
    dio.options.headers["server"] = "nginx";
    dio.options.headers["vary"] = "Accept-Encoding";
    response = await dio.get('https://www.bybt.com/api/api/futures/coins/markets');
    if(response.statusCode == 200) {
      exchangeRates = ExchangeRate.fromJson(response.data);
      exchangeRate = exchangeRates;
    } else {
      print("Invalid data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _mainCubit,
      listener: (BuildContext context, MainState state) {},
      child: BlocBuilder(
        cubit: _mainCubit,
        builder: (BuildContext context, MainState state) {
          return Stack(
            children: [
              _helper.mainWidget(state, exchangeRate, cards),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 66,
                  padding: EdgeInsets.symmetric(horizontal: 54),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(8, 22, 71, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.toString() == 'WalletScreenState'
                          ? Container(
                        width: 70,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/icons/active_wallet.svg',
                        ),
                      )
                          : InkWell(
                        onTap: () {
                          BlocProvider.of<MainCubit>(context).toWalletScreen();
                        },
                        child: Container(
                          width: 70,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/wallet.svg',
                          ),
                        ),
                      ),
                      state.toString() == 'ExchangeScreenState'
                          ? Container(
                        width: 70,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/icons/active_exchange.svg',
                        ),
                      )
                          : InkWell(
                        onTap: () {
                          BlocProvider.of<MainCubit>(context).toExchangeScreen();
                        },
                        child: Container(
                          width: 70,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/exchange.svg',
                          ),
                        ),
                      ),
                      state.toString() == 'ConversionScreenState'
                          ? Container(
                        width: 70,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/icons/active_conversion.svg',
                        ),
                      )
                          : InkWell(
                        onTap: () {
                          BlocProvider.of<MainCubit>(context).toConversionScreen();
                        },
                        child: Container(
                          width: 70,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/conversion.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
