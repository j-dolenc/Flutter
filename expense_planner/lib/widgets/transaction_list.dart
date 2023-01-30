import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
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
                  height: 200,
                  child: Image.asset(
                    "assets/images/emptylist.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 5,
                  ),
                  elevation: 1,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: FittedBox(
                          child: Text(
                            '€${transactions[index].amount}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(DateFormat('dd-MM-yyyy')
                        .format(transactions[index].date)),
                  ),
                );
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
              },
              itemCount: transactions.length,
            ),
    );
  }
}
