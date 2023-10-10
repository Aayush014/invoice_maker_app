import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:printing/printing.dart';

import '../Utils/prodectData.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final pdf = pd.Document();

  generatePdf() async {
    pdf.addPage(
      pd.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pd.ListView.builder(itemBuilder: (context, index) => pd.Container(
            height: 80,
            width: double.infinity,
            padding: const pd.EdgeInsets.all(10),
            margin: const pd.EdgeInsets.all(10),
            decoration: pd.BoxDecoration(
                border: pd.Border.all(
                  color: PdfColors.black,
                  width: 1.5,
                )
            ),
            child: pd.Row(
                mainAxisAlignment: pd.MainAxisAlignment.spaceEvenly,
                children: [
                  pd.Text('${productName[index]}',style: const pd.TextStyle(fontSize: 20),),
                  pd.Text('${productQty[index]}',style: const pd.TextStyle(fontSize: 20),),
                  pd.Text('${productAmount[index]}',style: const pd.TextStyle(fontSize: 20),),
                ]
            ),
          ), itemCount: productName.length);
        },
      ),
    );
    await Printing.layoutPdf(onLayout: (format) async => await pdf.save(),);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await generatePdf();
            },
            child: const Text("Generate PDF"),
          ),
        ),
      ),
    );
  }
}