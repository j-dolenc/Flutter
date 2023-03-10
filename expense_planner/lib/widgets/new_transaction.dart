import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/adaptive_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTrans;

  NewTransaction(this.addNewTrans) {
    // print("const new trans");
  }

  @override
  State<NewTransaction> createState() {
    // print("createState trans widget");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    // print("new trans state constructor");
  }
  // @override
  // void initState() {
  //   print("initstate()");
  //   //super is a key word that refers to the parent class
  //   super.initState();
  // }

  // @override
  // void didUpdateWidget(covariant NewTransaction oldWidget) {
  //   print("updated widget :)");
  //   //you get the old widget so you can compare it to the new one :flushed:

  //   super.didUpdateWidget(oldWidget);
  // }

  // @override
  // void dispose() {
  //   print("dispose()");
  //   super.dispose();
  // }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      //print(_selectedDate.toString());
      return;
    }
    print(_selectedDate.toString());
    widget.addNewTrans(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop(); //close the top most screen that is displayed
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (input) {
                //   titleInput = input;
                // },
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                //it just need a string as an argument even if we don't use it
              ), //for receiving text input
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (input) => amountInput = input,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No Date Chosen!"
                            : "Picked date: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}",
                      ),
                    ),
                    AdaptiveButton("Choose Date", _presentDatePicker),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text(
                  "Add Transaction",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: _submitData,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
