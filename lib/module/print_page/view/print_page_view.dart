import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import '../controller/print_page_controller.dart';

import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPageView extends StatefulWidget {
  const PrintPageView({Key? key}) : super(key: key);

  Widget build(context, PrintPageController controller) {
    controller.view = this;

    return Scaffold(
      body: PdfPreview(
        build: (format) => _generatePdf(format, "title"),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  @override
  State<PrintPageView> createState() => PrintPageController();
}
