import 'package:crypta/src/models/card.dart';
import 'package:crypta/src/models/exchange_rate.dart';
import 'package:crypta/src/screens/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ConversionScreen extends StatefulWidget {

  List<CardModel> cards;
  ExchangeRate exchangeRate;

  ConversionScreen(this.cards,this.exchangeRate);

  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {

  List<CardModel> get cards => widget.cards;

  ExchangeRate get exchangeRate => widget.exchangeRate;

  TextEditingController idControllerFrom = TextEditingController();
  TextEditingController idControllerTo = TextEditingController();
  TextEditingController sumController = TextEditingController();

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
                      "Your Cards",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width-20,
            height: 209,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return CardWidget(cards.elementAt(index).totalSum, cards.elementAt(index).id, cards.elementAt(index).name, cards.elementAt(index).symbol);
                }
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Your conversion",
            style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Conversion from",
                    style: TextStyle(
                        color: Color.fromRGBO(117,122,174,1),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 105,
                    height: 30,
                    child: TextFormField(
                      controller: idControllerFrom,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintText: "ID",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(8, 22, 71, 1),
                    ),
                    child: TextFormField(
                      controller: sumController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintText: "Sum",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          )
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  setState(() {

                    double sum;
                    cards.forEach((card) {
                      if(card.id==double.parse(idControllerFrom.text)){
                        exchangeRate.data.forEach((element) {
                          if(element.symbol==card.symbol){
                            if(card.totalSum*element.price>double.parse(sumController.text)){
                              sum=double.parse(sumController.text);
                              card.totalSum=card.totalSum-(sum/element.price);
                            }
                          }
                        });
                      }
                    });
                    cards.forEach((card) {
                      if(card.id==double.parse(idControllerTo.text)){
                        exchangeRate.data.forEach((element){
                          if(element.symbol==card.symbol){
                            card.totalSum=card.totalSum+(sum/element.price);
                          }
                        });
                      }
                    });
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(63, 166, 255, 1),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Icon(Icons.arrow_forward,
                    size: 30,
                    color: Colors.white,),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Conversion to",
                    style: TextStyle(
                        color: Color.fromRGBO(117,122,174,1),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 105,
                    height: 30,
                    child: TextFormField(
                      controller: idControllerTo,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintText: "ID",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
