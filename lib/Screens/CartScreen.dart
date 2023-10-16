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
        child: pw.Column(
          children: [
            pw.Container(
              height: 30,
              width: 500,
              decoration: pw.BoxDecoration(
                  color: PdfColors.grey,
                  borderRadius: pw.BorderRadius.circular(15)),
              child: pw.Center(
                child: pw.Text(
                  "Invoice",
                  style: const pw.TextStyle(fontSize: 25),
                ),
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Container(
              height: 130,
              width: 500,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 2),
                borderRadius: pw.BorderRadius.circular(15),
                color: PdfColors.white,
              ),
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Text("Mehul Kurhe & Co.",
                      style: pw.TextStyle(
                          fontSize: 30, fontWeight: pw.FontWeight.bold)),
                  pw.Center(
                    child: pw.Text(
                      "A1-404 Rangila Park Om Nagar \n       Dindoli-Surat-394210",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.Center(
                    child: pw.Text(
                      "Mob No:- 9879004689",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Container(
              width: 500,
              height: 550,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  width: 2,
                  color: PdfColors.blue,
                ),
                borderRadius: pw.BorderRadius.circular(20),
              ),
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Column(
                  children: [
                    pw.Center(
                      child: pw.Container(
                        height: 50,
                        width: 500,
                        child: pw.Text(
                          "                       $customerName",
                          style: const pw.TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    pw.Container(
                      height: 200,
                      width: 450,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                          width: 1.5,
                          color: PdfColors.black,
                        ),
                      ),
                      child: pw.Column(
                        children: [
                          pw.ListView.builder(
                              itemBuilder: (context, index) => pw.Container(
                                    height: 20,
                                    width: double.infinity,
                                    padding: const pw.EdgeInsets.all(10),
                                    margin: const pw.EdgeInsets.all(10),
                                    child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceEvenly,
                                        children: [
                                          pw.Text(
                                            '${index + 1}',
                                            style: const pw.TextStyle(
                                                fontSize: 17),
                                          ),
                                          pw.Text(
                                            '${productName[index]}',
                                            style: const pw.TextStyle(
                                                fontSize: 17),
                                          ),
                                          pw.Text(
                                            '${productQty[index]}',
                                            style: const pw.TextStyle(
                                                fontSize: 17),
                                          ),
                                          pw.Text(
                                            '${productAmount[index]}',
                                            style: const pw.TextStyle(
                                                fontSize: 17),
                                          ),
                                        ]),
                                  ),
                              itemCount: productName.length),
                          pw.Text(
                              '                              Total     ${total}',
                              style: pw.TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 40),
                    pw.Container(
                      height: 50,
                      width: 430,
                      color: PdfColors.grey300,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Text("Generic payment instructions here.",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                          pw.Text("Optional banking details here.",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
          child: const Icon(Icons.add),
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
