import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Flutter App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.red[600],
              child: Text(
                "CHART",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              elevation: 5,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    autocorrect: true,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(labelText: 'Reason'),
                    //This is another way to do the same thing as the below one
                    controller: titleController,
                    //This is one way to save data from inputField on UI to a variable
                    //in the code
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    cursorColor: Colors.red,
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    // onChanged: (value) => amountInput = value ,
                  ),
                  FlatButton(
                    child: Text("Add Transaction",
                    style: TextStyle(color: Colors.red),),
                    onPressed: () {
                      debugPrint(titleController.text);
                      debugPrint(amountController.text);
                    },
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((txn) {
              return Card(
                  color: Colors.red[400],
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          "₹ ${txn.amount} ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Reason: " + txn.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            DateFormat().format(txn.date),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
