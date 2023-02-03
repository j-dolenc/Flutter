import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import './models/transaction.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            title: 'Personal Expenses',
            home: MyHomePage(),
            //theme: ThemeData.dark(),
            theme: CupertinoThemeData(
              primaryColor: Colors.teal,
              primaryContrastingColor: Color.fromARGB(255, 202, 153, 5),

              //appBarTheme: AppBarTheme(...) you can use some of this but some is deprecated
              //primarySwatch: Colors.teal,
              //accentColor: Colors.amber, //use colorscheme instead...
            ),
          )
        : MaterialApp(
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
  bool _showChart = false;
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

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget tsListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Show chart"),
          Switch.adaptive(
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              }),
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTs))
          : tsListWidget
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget tsListWidget) {
    return [
      Container(
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.3,
          child: Chart(_recentTs)),
      tsListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Personal Expenses"),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                onTap: () => _startAddTs(context),
                child: Icon(CupertinoIcons.add),
              )
            ]),
          )
        : AppBar(
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final tsListWidget = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TransactionList(_transactions, _deleteTs));
    final bodyWidget = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              ..._buildLandscapeContent(mediaQuery, appBar, tsListWidget),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, tsListWidget),
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: bodyWidget,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyWidget,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddTs(context),
                  ),
          );
  }
}
