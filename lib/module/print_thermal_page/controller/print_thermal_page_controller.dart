library usb_thermal_printer_web;

import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import 'package:usb_thermal_printer_web/usb_thermal_printer_web.dart';
import '../view/print_thermal_page_view.dart';

class PrintThermalPageController extends State<PrintThermalPageView> {
  static late PrintThermalPageController instance;
  late PrintThermalPageView view;

  WebThermalPrinter _printer = WebThermalPrinter();

// A Dummy Function that you can call on any button and test.

  printReceipt() async {
    //Pairing Device is required.
    await _printer.pairDevice(vendorId: 0x6868, productId: 0x0200);

    await _printer.printText('DKT Mart', bold: true, centerAlign: true);
    await _printer.printEmptyLine();

    await _printer.printRow("Products", "Sale");
    await _printer.printEmptyLine();

    for (int i = 0; i < 10; i++) {
      await _printer.printRow(
          'A big title very big title ${i + 1}', '${(i + 1) * 510}.00 AED');
      await _printer.printEmptyLine();
    }

    await _printer.printDottedLine();
    await _printer.printEmptyLine();

    await _printer.printBarcode('123456');
    await _printer.printEmptyLine();

    await _printer.printEmptyLine();
    await _printer.closePrinter();
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
