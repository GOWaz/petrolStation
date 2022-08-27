import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/bill_provider/bill.dart';
import 'package:stationapp/providers/bill_provider/bill_provider.dart';

class BillDetail extends StatelessWidget {
  const BillDetail({Key? key}) : super(key: key);

  static const routeName = '/billDetail';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final billID = ModalRoute.of(context)!.settings.arguments as int;
    var bill = Bill(id: 0, amount: 0, payment: 0, userID: '', employeeID: '');
    if (billID.isNaN) {
      Navigator.pop(context);
    } else {
      bill = Provider.of<BillsProvider>(context).findById(billID);
    }

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: Text('${bill.id}'),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(20),
            height: size.height * 0.5,
            width: size.width / 3,
            color: color5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'ID: ${bill.id}',
                  style: GoogleFonts.inter(
                      color: color4, fontSize: size.height / 30),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Amount: ${bill.amount}',
                  style: GoogleFonts.inter(
                      color: color4, fontSize: size.height / 30),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Payment : ${bill.payment}',
                  style: GoogleFonts.inter(
                      color: color4, fontSize: size.height / 30),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Employee: ${bill.employeeID}',
                  style: GoogleFonts.inter(
                      color: color4, fontSize: size.height / 30),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
