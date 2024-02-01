import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import '../controller/web_socket_controller.dart';

class WebSocketView extends StatefulWidget {
  const WebSocketView({Key? key}) : super(key: key);

  Widget build(context, WebSocketController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("WebSocket"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              Text("WebSocket"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WebSocketView> createState() => WebSocketController();
}
