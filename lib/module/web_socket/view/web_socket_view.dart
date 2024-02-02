import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import '../controller/web_socket_controller.dart';

class WebSocketView extends StatefulWidget {
  const WebSocketView({Key? key}) : super(key: key);

  Widget build(context, WebSocketController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "WebSocket",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WebSocketView> createState() => WebSocketController();
}
