import 'package:flutter/material.dart';
import 'transactionDetails.dart';
import 'constant.dart';
import 'package:intl/intl.dart';
import 'alertBox.dart';

class Structure extends StatefulWidget {
  const Structure({Key? key}) : super(key: key);

  @override
  State<Structure> createState() => _StructureState();
}

class _StructureState extends State<Structure> {

  List<TransactionDetails> transactiondetails = [
    TransactionDetails(name: 'Johnson', payment: 'credit', amount: 12000.78, date: DateTime.now())
  ];

  void displayDialog() {
    showDialog(context: context, builder: (context){
      return BoxDialog(onAddTransactionDetails: updateDetails ,);
    });
  }

  void updateDetails(TransactionDetails newUpdate) {
    setState(() {
      transactiondetails.add(newUpdate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color(0xff6aa688),
    title: const Center(child: Text('Home Page')),
    ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(
            leading: CircleAvatar(
            backgroundColor: transactiondetails[index].payment == 'credit' ? Colors.green : Colors.red,
            child: Icon(
              transactiondetails[index].payment == 'credit' ? Icons.arrow_back   : Icons.arrow_forward,
            ),
            ),
            title: Text(
              transactiondetails[index].name,
              style: kNameStyle,
            ),
            subtitle: Text(
                transactiondetails[index].payment,
            ),
            trailing: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text( NumberFormat.simpleCurrency(locale: 'en_NG', decimalDigits: 2).format(transactiondetails[index].amount),
                    style: transactiondetails[index].payment == 'credit' ? kAmountCredit : kAmountDebit,
                  ),
                  Text('${transactiondetails[index].date.hour} : ${transactiondetails[index].date.minute} : ${transactiondetails[index].date.second}')
                ]
              ),
            ),
          );
        },
          itemCount: transactiondetails.length,
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        displayDialog();
      },
      backgroundColor: Color(0xff6aa688),
      child: const Text('Edit',
      style: kfloatStyle,
      ),
      ),
    );
    }
}

