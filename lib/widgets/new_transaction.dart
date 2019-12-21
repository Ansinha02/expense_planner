import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(
      txnTitle: title,
      txnAmount: amount,
      chosenDate: _selectedDate,
    );

    // This statment closes the transaction sheet that opens up on pressing the add button after adding a transaction.
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              autocorrect: true,
              // autofocus: true,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(labelText: 'Reason'),
              //This is another way to do the same thing as the below one
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              //This is one way to save data from inputField on UI to a variable
              //in the code
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              cursorColor: Colors.red,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => amountInput = value ,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "Select Date: "
                          : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate)}',
                      // onChanged: (value) => amountInput = value ,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.date_range,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text(
                "Add Transaction",
              ),
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
