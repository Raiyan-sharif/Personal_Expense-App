import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';
import 'package:personal_expense_app/widgets/user_transactions.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


//  String titleInput;
//  String amountInput;
  final titleController = TextEditingController();
  final amountControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),

            UserTransactions(),
//            TransactionList(),

          ],
        ),
      ),
    );
  }
}

