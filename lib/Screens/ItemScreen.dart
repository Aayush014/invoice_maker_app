import 'package:flutter/material.dart';

import '../Utils/prodectData.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  TextEditingController txtProductName = TextEditingController();
  TextEditingController txtCustomerName = TextEditingController();
  TextEditingController txtProductPrice = TextEditingController();
  TextEditingController txtProductQty = TextEditingController();
  TextEditingController txtProductDiscount = TextEditingController();
  TextEditingController txtProductCategory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0F2C59),
          leading: const Icon(Icons.storefront, size: 30),
          title: const Text("Invoice Generator"),

        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                textFieldBox(
                    txtCustomerName,
                    const Icon(
                      Icons.person,
                    ),
                    'Customer Name'),
                textFieldBox(
                    txtProductName,
                    const Icon(
                      Icons.shopping_bag,
                    ),
                    'Product Name'),
                textFieldBox(
                    txtProductPrice,
                    const Icon(
                      Icons.currency_rupee,
                    ),
                    'Price'),
                textFieldBox(
                    txtProductQty,
                    const Icon(
                      Icons.numbers,
                    ),
                    'Qty'),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff0F2C59)),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {

                    setState(() {
                      int finalprice = int.parse(txtProductQty.text) * int.parse(txtProductPrice.text);
                      productName.add(txtProductName.text);
                      productAmount.add(finalprice);
                      productQty.add(txtProductQty.text);
                      Navigator.of(context).pushReplacementNamed('cart');
                    });

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textFieldBox(TextEditingController name, Icon i1, String pname) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: name,
      decoration: InputDecoration(
        labelText: pname,
        prefixIcon: i1,
      ),
    ),
  );
}
