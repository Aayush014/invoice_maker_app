import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../Utils/prodectData.dart';

final pdf = pw.Document();

generatePdf() async {
  pdf.addPage(pw.Page(
    build: (context) {
      return pw.Container(
        height: double.infinity,
        width: double.infinity,
        child: pw.Column(children: [
          pw.Container(
            height: 30,
            width: 500,
            decoration: pw.BoxDecoration(color: PdfColors.grey,
            borderRadius: pw.BorderRadius.circular(15)),
            color: PdfColors.grey,
            child: pw.Center(
              child: pw.Text(
                "Invoice",
                style: pw.TextStyle(fontSize: 25),
              ),
            ),
          ),
          pw.Container(
            height: 150,
            width: 500,
            decoration: pw.BoxDecoration(

              border: pw.Border.all(width: 2),
              borderRadius: pw.BorderRadius.circular(15),
              color: PdfColors.white,
            ),
            child: pw.Column(
            )
          )
        ]),
      );
    },
    pageFormat: PdfPageFormat.a4,
  ));
  await Printing.layoutPdf(
    onLayout: (format) async => await pdf.save(),
  );
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartSCreenState();
}

class _CartSCreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0F2C59),
          leading: const Icon(Icons.storefront, size: 30),
          title: const Text("Invoice Generator"),
          actions: [
            const Icon(
              Icons.share_rounded,
              size: 30,
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              child: const Icon(Icons.picture_as_pdf_rounded, size: 30),
              onTap: () async {
                for (int i = 0; i < productAmount.length; i++) {
                  total = total + productAmount[i];
                }
                await generatePdf();
              },
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => productBox(index),
          itemCount: productName.length,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff0F2C59),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('item');
          },
        ),
      ),
    );
  }
}

Widget productBox(int index) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
    height: 80,
    width: double.infinity,
    child: ListTile(
      leading: Text(
        '${productName[index]}',
        style: const TextStyle(fontSize: 18),
      ),
      title: Text(
        '${productQty[index]} Qty',
        style: const TextStyle(fontSize: 18),
      ),
      trailing: Text(
        '${productAmount[index]}/-',
        style: const TextStyle(fontSize: 18),
      ),
    ),
  );
}
