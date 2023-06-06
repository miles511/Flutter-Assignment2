import 'package:flutter/material.dart';
import 'transactionDetails.dart';


class BoxDialog extends StatefulWidget {
  const BoxDialog({Key? key, required this.onAddTransactionDetails}) : super(key: key);

  final void Function (TransactionDetails) onAddTransactionDetails;

  @override
  State<BoxDialog> createState() => _BoxDialogState();
}

class _BoxDialogState extends State<BoxDialog> {

  var selectedDepositValue = '1';

  List<String> depositValues = [
    'credit',
    'debit',
  ];

  final nameEditingController = TextEditingController();
  final amountEditingController = TextEditingController();
  final transactionDetailsController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text('Update History'),
      content: Container(
        height: 250.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             TextField(
               controller: nameEditingController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),

            TextField(
              controller: transactionDetailsController,
              decoration: InputDecoration(
                hintText:  'transaction details',

              ),
            ),

            
            // DropdownButtonFormField(
            //   decoration: const InputDecoration(
            //       labelText: 'Transaction Description'
            //   ),
            //   value: selectedDepositValue,
            //   onChanged: (newValue){
            //     setState(() {
            //       selectedDepositValue = newValue!;
            //     });
            //
            //   },
            //
            //     items: depositValues.map((value){
            //       return DropdownMenuItem<String>(
            //         value: value,
            //           child: Text(value),);
            //     }).toList(),
            // ),

            TextField(
              controller: amountEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Amount',
              ),
            ),
            // TextField(
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     hintText: 'Date',
            //   ),
            // ),
            TextButton(onPressed: (){
                  final newUpdate = TransactionDetails(
                      name: nameEditingController.text,
                      payment: transactionDetailsController.text,
                      amount: double.parse(amountEditingController.text),
                      date: DateTime.now());

                  widget.onAddTransactionDetails(newUpdate);
                   Navigator.of(context).pop();

            }, child:  Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff6aa688),
                borderRadius: BorderRadius.circular(10),
              ),
                child: const Center(child: Text('update',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
                )))),
          ]
        ),
      ),
    );
  }
}


