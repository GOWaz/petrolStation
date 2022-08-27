// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/bill_provider/bill_provider.dart';
import 'package:stationapp/widgets/bill_widget/bill_item.dart';

class BillView extends StatefulWidget {
  const BillView({Key? key}) : super(key: key);

  @override
  State<BillView> createState() => _BillViewState();
}

class _BillViewState extends State<BillView> {
  Future<void> _updateBillList(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<BillsProvider>(context, listen: false).fetchPills();
    } catch (error) {
      print(error);
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An error occurred!'),
          content: const Text('Something went wrong.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  var _isInit = true;
  var _isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<BillsProvider>(context).fetchPills();
      } catch (error) {
        //print(error);
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occurred!'),
            content: const Text('Something went wrong.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bills = Provider.of<BillsProvider>(context).bills;
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              _updateBillList(context);
            }),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: ScrollController(),
              itemCount: bills.length,
              itemBuilder: (_, i) => Column(
                children: [
                  BillItem(bills[i].id, bills[i].amount, bills[i].payment),
                ],
              ),
            ),
    );
  }
}
