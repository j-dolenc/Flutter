import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTs,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTs;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const availableColors = [
      Colors.red,
      Colors.amber,
      Colors.blue,
      Colors.green
    ];

    _bgColor = availableColors[Random().nextInt(4)];
  }

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
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: FittedBox(
              child: Text(
                '€${widget.transaction.amount}',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle:
            Text(DateFormat('dd-MM-yyyy').format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).errorColor)),
                onPressed: () => widget.deleteTs(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text("Delete"),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTs(widget.transaction.id),
              ),
      ),
    );
  }
}
