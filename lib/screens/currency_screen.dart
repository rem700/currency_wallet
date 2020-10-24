import 'package:currency_wallet/wigets/currency_box.dart';
import 'package:flutter/material.dart';
// import 'package:currency_wallet/wigets/currency_list.dart';
import 'package:currency_wallet/network/api_manager.dart';



class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  // String selectedCurrency;
  // double buy;
  // double sale;
  // String url = 'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5';


  bool isWaiting = false;
  Map<String, String> currencyValues = {};
  void getData() async {
    isWaiting = true;
    try {
      var data = await CurrencyData().getCurrencyData();
      isWaiting = false;
      setState(() {
        currencyValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 40.0,
              bottom: 12.0,

            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18.0,
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.teal,
                    size: 25.0,),
                ),
                SizedBox(
                  width: 18.0,
                ),
                Text(
                  'Currency Wallet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: CurrencyList()
            ),
          ),
        ],
      ),
    );
  }
}

class CurrencyList extends StatefulWidget {

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  String name;
  String buy;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CurrencyBox(name: currenciesList[index], buy: currencyValues[index],);
      },
      itemCount: currenciesList.length,);

  }
}


