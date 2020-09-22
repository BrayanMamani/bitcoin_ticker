import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4302B001-7F09-4829-BD09-FADD31FFFB57';

class CoinData {
  Future<dynamic> getCoinData() async {
    String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
