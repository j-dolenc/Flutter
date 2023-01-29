import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTrans;

  NewTransaction(this.addNewTrans);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget.addNewTrans(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop(); //close the top most screen that is displayed
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (input) {
              //   titleInput = input;
              // },
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //it just need a string as an argument even if we don't use it
            ), //for receiving text input
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (input) => amountInput = input,
            ),
            TextButton(
              child: Text("Add Transaction"),
              onPressed: submitData,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 75, 163, 207)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
