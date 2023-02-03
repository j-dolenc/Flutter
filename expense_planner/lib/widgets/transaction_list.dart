import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTs;
  TransactionList(this.transactions, this.deleteTs);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    //to fit the image into something
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/emptylist.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      transaction: tx,
                      deleteTs: deleteTs,
                      key: ValueKey(tx.id),
                    ))
                .toList(),
            // return Card(
            //   child: Row(
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Theme.of(context).colorScheme.primary,
            //             width: 2,
            //           ),
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(6),
            //           ),
            //         ),
            //         padding: EdgeInsets.all(10),
            //         margin:
            //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //         child: Text(
            //           '€${transactions[index].amount.toStringAsFixed(2)}',
            //           style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 20,
            //               color: Theme.of(context).colorScheme.secondary),
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             transactions[index].title,
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             DateFormat('dd-MM-yyyy')
            //                 .format(transactions[index].date),
            //             style: TextStyle(
            //               color: Colors.grey,
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // );
          );
  }
}
