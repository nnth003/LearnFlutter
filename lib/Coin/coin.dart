import 'package:flutter/material.dart';
import 'data_coin.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Coin extends StatelessWidget {
  const Coin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PriceScreen(),
    );
  }
}

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String select = 'USD';

  DropdownButton<String> android() {
    List<DropdownMenuItem<String>> drop = [];
    for (String current in currenciesList) {
      var newItem = DropdownMenuItem(value: current, child: Text(current));
      drop.add(newItem);
    }
    return DropdownButton<String>(
      value: select,
      items: drop,
      onChanged: (value) {
        setState(() {
          select = value!;
          getData();
        });
      },
    );
  }

  CupertinoPicker ios() {
    List<Text> item = [];
    for (String current in currenciesList) {
      item.add(Text(current));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (select) {
      setState(() {
        this.select = currenciesList[select];
        getData();
      });
      },
      children: item,
    );
  }
  Widget getPick(){
    if(Platform.isIOS){
      return ios();
    }else if(Platform.isAndroid){
      return android();
    }else{
      return Container();
    }
  }
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    setState(() {
      isWaiting = true;
    });

    try {
      var data = await CoinData().getCoinData(select);
      isWaiting = false;
      setState(() {
        coinValues = data;
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

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: select,
          value: isWaiting ? '?' : coinValues[crypto]?.toString() ?? 'N/A',
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🤑 Coin Ticker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
          //   child: Card(
          //     color: Colors.lightBlueAccent,
          //     elevation: 5.0,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          //       child: Text(
          //         '1 BTC = ? USD',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(fontSize: 20.0, color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? android() : ios(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
