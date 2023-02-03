import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTs,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTs;

  @override
  Widget build(BuildContext context) {
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
                '€${transaction.amount}',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(DateFormat('dd-MM-yyyy').format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).errorColor)),
                onPressed: () => deleteTs(transaction.id),
                icon: Icon(Icons.delete),
                label: Text("Delete"),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTs(transaction.id),
              ),
      ),
    );
  }
}
