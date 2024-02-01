import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import '../controller/print_thermal_page_controller.dart';

class PrintThermalPageView extends StatefulWidget {
  const PrintThermalPageView({Key? key}) : super(key: key);

  Widget build(context, PrintThermalPageController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PrintThermalPage"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  controller.printReceipt();
                },
                child: Text("data"),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<PrintThermalPageView> createState() => PrintThermalPageController();
}
