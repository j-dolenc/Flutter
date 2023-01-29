import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTrans;

  NewTransaction(this.addNewTrans);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    addNewTrans(
      enteredTitle,
      enteredAmount,
    );
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
