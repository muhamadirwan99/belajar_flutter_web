import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';

class PrintPageController extends State<PrintPageView> {
  static late PrintPageController instance;
  late PrintPageView view;

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
