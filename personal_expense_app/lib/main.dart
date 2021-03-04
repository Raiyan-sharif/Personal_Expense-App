import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/chart.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';

import 'models/transaction.dart';


void main() {
  runApp(MaterialApp(
    title: 'Personal Expenses',
    theme: ThemeData(
      primarySwatch: Colors.teal,
      accentColor: Colors.blueGrey,
      fontFamily: 'Quicksand',
      appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
        title: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),),

    ),
    home: MyApp(),
  )
  );
}

class MyApp extends StatefulWidget {


//  String titleInput;
//  String amountInput;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  final titleController = TextEditingController();
//
//  final amountControlller = TextEditingController();


  final List<Transaction> _userTransactions = [
//    Transaction(
//      id: 't1',
//      title: 'New shoes',
//      amount: 69.99,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'Weekly Groceries',
//      amount: 20.5,
//      date: DateTime.now(),
//    ),
  ];

  List<Transaction> get _recentTransaction{
    return _userTransactions.where((element){
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTX = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString()
    );
    setState(() {
      _userTransactions.add(newTX);
    });
  }

  void deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((element)=>element.id == id);
    });

  }

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return GestureDetector(
        onTap: (){

        },
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Text(
            'Personal Expenses',
          ),
          actions: [
            IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recentTransaction),

              TransactionList(_userTransactions,deleteTransaction),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> _startAddNewTransaction(context),
        ),
      );
  }
}

