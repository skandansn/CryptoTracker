import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Coin> fetchDoge() async {
  http.Response x =
      await http.get(Uri.https('api.coingecko.com', '/api/v3/coins/dogecoin'));
  return Coin.fromJson(jsonDecode(x.body));
}

class Coin {
  String price;
  Coin({this.price});
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      price: (json["market_data"]["current_price"]["usd"]).toString(),
    );
  }
}
