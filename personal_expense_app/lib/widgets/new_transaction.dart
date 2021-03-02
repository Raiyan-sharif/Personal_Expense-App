import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountControlller = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
//                      onChanged: (value){
//                        this.titleInput = value;
//                      },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControlller,
//                      onChanged: (value){
//                        this.amountInput = value;
//                      },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountControlller.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
