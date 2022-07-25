import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:userapp/constants.dart';
import 'package:userapp/pages/home%20page/home_page.dart';
import 'package:userapp/widgets/sign_in_up_button.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);
  static const routeName = '/Order';
  @override
  State<Order> createState() => OrderState();
}

List<String> liters = [
  "10",
  "20",
  "30",
  "40",
  "50",
  "60",
  "70",
  "80",
  "90",
  "100",
];


class OrderState extends State<Order> {
  List<String> type = ["Petrol", "Diesel"];
  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  getDslDecoration() {
    return const BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.amber),
        top: BorderSide(width: 1, color: Colors.amber),
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            alignment: Alignment.center,
            color: color1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            icon: const Icon(Icons.arrow_back)),
        shadowColor: Colors.amber,
        backgroundColor: Colors.white,
        title: const Text(
          'order',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: DirectSelectContainer(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'You haven`t ordered yet !!!',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            color: color3,
                          ),
                        ),
                        const Text(
                          'Let`s ask',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            color: color3,
                          ),
                        ),
                        const Divider(
                          color: color1,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          margin: const EdgeInsets.only(left: 4),
                          child: const Text(
                            "Fuel type",
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Card(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: DirectSelectList<String>(
                                            values: type,
                                            defaultItemIndex: 1,
                                            itemBuilder: (String value) =>
                                                getDropDownMenuItem(value),
                                            focusedItemDecoration:
                                                getDslDecoration(),
                                            onItemSelectedListener:
                                                (item, index, context) {
                                              // ignore: deprecated_member_use
                                              Scaffold.of(context)
                                                  // ignore: deprecated_member_use
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              )));
                                            }))),
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Icons.unfold_more,
                                    color: Colors.amber,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          margin: const EdgeInsets.only(left: 4),
                          child: const Text(
                            "Number of liters of fuel",
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Card(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: DirectSelectList<String>(
                                            values: liters,
                                            defaultItemIndex: 5,
                                            itemBuilder: (String value) =>
                                                getDropDownMenuItem(value),
                                            focusedItemDecoration:
                                                getDslDecoration(),
                                            onItemSelectedListener:
                                                (item, index, context) {
                                              // ignore: deprecated_member_use
                                              Scaffold.of(context)
                                                  // ignore: deprecated_member_use
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              )));
                                            }))),
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Icons.unfold_more,
                                    color: Colors.amber,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: const EdgeInsets.only(left: 12),
                    child: const Text(
                      "Vehicle Id",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      padding: const EdgeInsets.all(12),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SignInUpButton(text: 'Request', onPress: () {})],
                  ),
                const  SizedBox(height: 60,),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                Image(
                  image: AssetImage('images/fuel.png'),
                  height: 60,
                )
              ]),
                ],
              ),
            )),
      ),
    );
  }
}
