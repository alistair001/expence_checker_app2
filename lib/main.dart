
import 'package:expence_checker_app2/widgets/chart.dart';
import 'package:expence_checker_app2/widgets/new_transaction.dart';
import 'package:expence_checker_app2/widgets/transaction_list.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
          ),
        ),
        //Depricated **** accentColor: Colors.amber,
      )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState()=> _MyHomePage();
}
  //String titleInput;
  //String amountInput;
class _MyHomePage extends State<MyHomePage> {
  final titleCont = TextEditingController();
  final amountCont = TextEditingController();

  final List<Transaction> _userTransactions = [
    /*Transaction(
      id: "tran1",
      title: "New Shoes",
      amount: 44.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tran2",
      title: "Food",
      amount: 90.50,
      date: DateTime.now(),
    )*/
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
          Duration(days: 7)
        ),
      );
    }).toList();
  }

  void _addNewTransaction (String txTitle, double txAmount){
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bCtx){
      return GestureDetector(
        onTap: (){},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
      );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.add),
            onPressed: ()=> _startAddNewTransaction(context),)],
      ),
      body: SingleChildScrollView(
        child:Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_userTransactions)
       ]
      ,),
    ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=> _startAddNewTransaction(context),),
    );
  }
}
