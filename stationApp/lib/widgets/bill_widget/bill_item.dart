import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/bill_details.dart';

class BillItem extends StatelessWidget {
  final int id;
  final int amount;
  final int payment;
  const BillItem(this.id, this.amount, this.payment, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          Navigator.pushNamed(context, BillDetail.routeName, arguments: id),
      leading: const Icon(
        Icons.monetization_on,
        color: color5,
      ),
      title: Text('$payment'),
      subtitle: Text('$amount'),
      trailing: Text('$id'),
    );
  }
}
