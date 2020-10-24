import 'package:http/http.dart' as http;
import 'dart:convert';





const List<String> currenciesList = [
  'USD',
  'EUR',
  'RUB',
];

const String url = 'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5';


class CurrencyData {
  Future getCurrencyData() async {
    Map<String, String> currencyPrices = {};
    for (String currency in currenciesList) {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        int i = 0;
        String lastPrice = decodedData[i]['buy'];
        i ++;
        currencyPrices[currency] =lastPrice;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return currencyPrices;
  }
}



