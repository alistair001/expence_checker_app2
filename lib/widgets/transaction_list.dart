import '../models/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(children: <Widget>[
        Text ("No Transactions Yet",
            style: Theme.of(context).textTheme.headline6),
        SizedBox(
          //quick margin between widgets
          height: 20,
        ),
        Container(
          height: 200,
          child:Image.asset("assets/images/waiting.png",
            fit: BoxFit.cover,),
        )
      ],): ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColorDark,
                    width: 2,
                  )) ,
              padding: EdgeInsets.all(10),
              child: Text("£ ${transactions[index].amount.toStringAsFixed(2)}",// "\$" required for $ but not £
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColorDark)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text(transactions[index].title.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )
                ),
                Text(DateFormat("dd-MMM-yyyy").format(transactions[index].date),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,)
                ),
              ],),
          ],
        ),
      );
      },
      itemCount: transactions.length,
      ),
    );
  }
}