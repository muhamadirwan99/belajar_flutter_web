import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({Key? key}) : super(key: key);

  Widget build(context, BerandaController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  Get.to(
                    CameraPageView(cameras: controller.cameras),
                  );
                },
                child: const Text(
                  "Camera Page",
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  Get.to(
                    GeolocationView(),
                  );
                },
                child: const Text(
                  "Geolocation Page",
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  Get.to(
                    WebSocketView(),
                  );
                },
                child: const Text(
                  "Web Socket Page",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<BerandaView> createState() => BerandaController();
}
