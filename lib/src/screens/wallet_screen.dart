import 'package:crypta/src/models/card.dart';
import 'package:crypta/src/screens/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletScreen extends StatefulWidget {
  List<CardModel> cards;

  WalletScreen(this.cards);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  TextEditingController symbolController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController sumController = TextEditingController();

  List<CardModel> get cards => widget.cards;

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
                        "Hi, Eduard, have a nice day!",
                        style: TextStyle(
                            color: Color.fromRGBO(117, 172, 174, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Your wallet",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 26, bottom: 45, left: 34, right: 31),
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
                                child: Container(
                                  width: 40,
                                  height: 20,
                                  child: TextFormField(
                                    controller: symbolController,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 105,
                                  height: 18,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: TextFormField(
                                    controller: idController,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                        fillColor: Color.fromRGBO(22,27,80,1)
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 18,
                                  width: 125,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color.fromRGBO(63, 166, 255, 1)
                                  ),
                                  child: TextFormField(
                                    controller: nameController,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                        fillColor: Color.fromRGBO(22,27,80,1)
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
                            Container(
                              width:122,
                              height: 23,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                controller: sumController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    fillColor: Color.fromRGBO(22,27,80,1)
                                ),
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset('assets/icons/logo.svg'),
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      cards.add(CardModel(double.parse(sumController.text), int.parse(idController.text), nameController.text, symbolController.text));
                    });
                  },
                  child: Container(
                    height: 69,
                    width: 329,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(63, 166, 255, 1)
                    ),
                    child: Text(
                      "Add a card",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}
