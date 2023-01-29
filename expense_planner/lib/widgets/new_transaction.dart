import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTrans;

  NewTransaction(this.addNewTrans);

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
            ), //for receiving text input
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (input) => amountInput = input,
            ),
            TextButton(
              child: Text("Add Transaction"),
              onPressed: () {
                addNewTrans(
                    titleController.text, double.parse(amountController.text));
              },
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
