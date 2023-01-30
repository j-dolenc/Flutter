import 'package:flutter/material.dart';
import './models/transaction.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      //theme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.teal,
              secondary: Color.fromARGB(255, 202, 153, 5),
            ),
        fontFamily: 'Quicksand',
        //appBarTheme: AppBarTheme(...) you can use some of this but some is deprecated
        //primarySwatch: Colors.teal,
        //accentColor: Colors.amber, //use colorscheme instead...
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String titleInput;

  void _startAddTs(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.42,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Groceries',
    //   amount: 114.20,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTs {
    return _transactions.where((el) {
      return el.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime dat) {
    final newTs = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: dat,
    );
    setState(() {
      _transactions.add(newTs);
    });
  }

  void _deleteTs(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      toolbarTextStyle:
          TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
      title: Text(
        'Personal Expenses',
      ),
      actions: [
        IconButton(
          onPressed: () => _startAddTs(context),
          icon: Icon(Icons.add),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.4,
                child: Chart(_recentTs)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.6,
                child: TransactionList(_transactions, _deleteTs)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddTs(context),
      ),
    );
  }
}
