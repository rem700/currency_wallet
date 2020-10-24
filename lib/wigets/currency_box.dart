import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {

  const CurrencyBox({this.name, this.buy});
  final String name;
  final String buy;
  // double sale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 5.0,
      ),
      color: Colors.white,
      child: Container(
        child: ListTile(
          title: Text(
              '$name buy: $buy sale: ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
          ),),),
        color: Colors.teal,),
    );
  }
}