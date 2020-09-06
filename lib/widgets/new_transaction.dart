
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget{
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState  createState()=> _NewTransactionState();
}
class _NewTransactionState extends State<NewTransaction>{
  final titleCont = TextEditingController();
  final amountCont = TextEditingController();


  void submitData(){
    final enteredTitle = titleCont.text;
    final enteredAmnt = double.parse(amountCont.text);

    if (enteredTitle.isEmpty || enteredAmnt<=0){
      return;
    }
    //access state class inside this class
    widget.addTx(
          enteredTitle,
          enteredAmnt,
      );

    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget> [
            TextField(decoration: InputDecoration(labelText: "Title"),
              controller: titleCont,
              onSubmitted: (_)=>submitData(),),
            //onChanged: (value)=> titleInput=value,),
            TextField(decoration: InputDecoration(labelText: "Amount"),
              controller: amountCont,
            keyboardType: TextInputType.number,
            onSubmitted: (_)=>submitData(),),
            //onChanged: (value2)=> amountInput=value2,),
            FlatButton(
              child: Text("Add"),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}