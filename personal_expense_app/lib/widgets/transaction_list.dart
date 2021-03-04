import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTX;
  TransactionList(this.transactions,this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
//          return Card(
//            child: Row(
//              children: [
//                Container(
//                  margin: EdgeInsets.symmetric(
//                    vertical: 10,
//                    horizontal: 15,
//                  ),
//                  decoration: BoxDecoration(
//                      border: Border.all(
//                        color: Theme.of(context).primaryColor,
//                        width: 2,
//                      )),
//                  padding: EdgeInsets.all(10),
//                  child: Text(
//                    '\$ ${transactions[index].amount.toStringAsFixed(2)}',
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 20,
//                        color: Theme.of(context).primaryColor),
//                  ),
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Text(
//                      transactions[index].title,
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 16,
//                          color: Colors.black
//                      ),
//                    ),
//                    Text(
//                      DateFormat('dd-LLL-yyyy').format(transactions[index].date),
//                      style: TextStyle(
//                          color: Colors.grey
//                      ),
//                    ),
//                  ],
//                )
//              ],
//            ),
//          );
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                      color: Theme.of(context).errorColor,),
                      onPressed: () => deleteTX(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
//        children: transactions .map((tx) {
//
//        }).toList(),
            ),
    );
  }
}
