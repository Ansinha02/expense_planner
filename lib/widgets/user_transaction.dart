import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'TR001',
      title: 'Maggie',
      amount: 19.57,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'TR002',
      title: 'Apple Juice',
      amount: 100.00,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction({String txnTitle, double txnAmount}) {
    final newTransaction = Transaction(
      title: txnTitle,
      amount: txnAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionsList(_userTransactions),
      ],
    );
  }
}
