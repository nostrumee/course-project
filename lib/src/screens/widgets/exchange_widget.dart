import 'package:flutter/material.dart';

class Exchange extends StatelessWidget {
  String symbol;
  double priceChange;
  double price;
  Color color;

  Exchange(this.symbol, this.priceChange, this.price, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: color,
                ),
                child: Text(symbol, style: TextStyle(color: Colors.white, fontSize: 14),),
              ),
              Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "$price USD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(8, 22, 71, 1),
                ),
                child: Text(
                  "24H change: $priceChange%",
                  style: TextStyle(
                    color: Color.fromRGBO(117, 172, 174, 1),
                    fontSize: 16
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: Color.fromRGBO(117, 172, 174, 1),
          )
        ],
      )
    );
  }
}
