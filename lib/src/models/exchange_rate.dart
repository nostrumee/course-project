import 'dart:convert';

class ExchangeRate {
  ExchangeRate({
    this.code,
    this.msg,
    this.data,
    this.success,
  });

  String code;
  String msg;
  List<Datum> data;
  bool success;

  factory ExchangeRate.fromJson(var str) => ExchangeRate.fromMap(str);

  String toJson() => json.encode(toMap());

  factory ExchangeRate.fromMap(Map<String, dynamic> json) => ExchangeRate(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
    "success": success == null ? null : success,
  };
}

class Datum {
  Datum({
    this.symbol,
    this.price,
    this.priceChangePercent,
  });

  String symbol;
  double price;
  double priceChangePercent;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    symbol: json["symbol"] == null ? null : json["symbol"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    priceChangePercent: json["priceChangePercent"] == null ? null : json["priceChangePercent"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "symbol": symbol == null ? null : symbol,
    "price": price == null ? null : price,
    "priceChangePercent": priceChangePercent == null ? null : priceChangePercent,
  };
}
