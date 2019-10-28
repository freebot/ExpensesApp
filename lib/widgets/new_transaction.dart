import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if( enteredTitle.isEmpty || enteredAmount <= 0 ) {
      return;
    }

    widget.addTx(
                  enteredTitle,
                  enteredAmount,
                );
                Navigator.of(context).pop();
  }

  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Descripción'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (valor) {
              //  titleInput = valor;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Cantidad'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (valor) => amountInput = valor,
            ),
            FlatButton(
              child: Text('Agregar'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
