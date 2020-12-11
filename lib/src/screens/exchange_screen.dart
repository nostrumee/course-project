import 'package:crypta/src/models/card.dart';
import 'package:crypta/src/models/exchange_rate.dart';
import 'package:crypta/src/screens/widgets/exchange_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypta/src/blocs/main_bloc/main_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:random_color/random_color.dart';

class ExchangeScreen extends StatefulWidget {

  ExchangeRate exchangeRate;
  List<CardModel> cards;

  ExchangeScreen(this.exchangeRate, this.cards);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {

  ExchangeRate get exchangeRate => widget.exchangeRate;

  RandomColor _randomColor = RandomColor();

  List<CardModel> get cards => widget.cards;

  double sum = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cards.forEach((card) {
      double usdPrice;
      exchangeRate.data.forEach((element) {
        if(element.symbol==card.symbol){
          usdPrice=card.totalSum*element.price;
          sum+=usdPrice;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 66, right: 10, left: 10, top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total cash",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${sum.toInt()} USD",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 25
            ),
            child: Text(
              "Exchange Rate",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.68,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemCount: exchangeRate.data.length,
                itemBuilder: (context, index) {
                  return Exchange(exchangeRate.data.elementAt(index).symbol, exchangeRate.data.elementAt(index).priceChangePercent, exchangeRate.data.elementAt(index).price, _randomColor.randomColor());
                }
            ),
          ),
        ],
      )
    );
  }
}
