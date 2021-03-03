import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountControlller = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
     var enteredAmount;
    if(!amountControlller.text.isEmpty){
      enteredAmount = double.parse(amountControlller.text);
    }else{
      enteredAmount = -1;
    }

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    widget.addTx(
      titleController.text,
      double.parse(amountControlller.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',

              ),

              controller: titleController,
              onSubmitted: (_) =>submitData(),
//                      onChanged: (value){
//                        this.titleInput = value;
//                      },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControlller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>submitData(),
//                      onChanged: (value){
//                        this.amountInput = value;
//                      },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
