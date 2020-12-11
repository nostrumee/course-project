import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {

  double totalSum;
  int id;
  String name;
  String symbol;

  CardWidget(this.totalSum, this.id, this.name, this.symbol);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 26, bottom: 45, left: 34, right: 31),
      margin: EdgeInsets.only(right: 15),
      height: 209,
      width: 329,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(49, 59, 98, 1),
            Color.fromRGBO(3, 27, 63, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 65,
                width: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color.fromRGBO(63, 166, 255, 1)
                ),
                child: Text(
                  symbol,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:24
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    id.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:20
                    ),
                  ),
                  Container(
                    height: 18,
                    width: 105,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color.fromRGBO(63, 166, 255, 1)
                    ),
                    child: Text(
                      "$name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:14
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${totalSum.toInt()} $symbol",
                style: TextStyle(
                    color: Colors.white,
                    fontSize:24
                ),
              ),
              Container(
                child: SvgPicture.asset('assets/icons/logo.svg'),
              )
            ],
          )
        ],
      )
    );
  }
}
