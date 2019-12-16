import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  void submitData() {

    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if(title.isEmpty || amount <= 0){
      return;
    }

    addTransaction(
      txnTitle: title,
      txnAmount: amount,
    );
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
              cursorColor: Colors.red,
              decoration: InputDecoration(labelText: 'Reason'),
              //This is another way to do the same thing as the below one
              controller: titleController,
              onSubmitted: (_) => submitData(),
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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => amountInput = value ,
            ),
            FlatButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
