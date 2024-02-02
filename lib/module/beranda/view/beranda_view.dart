import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({Key? key}) : super(key: key);

  Widget build(context, BerandaController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 3,
                color: Colors.green,
                onPressed: () {
                  router.go(
                    '/camera',
                    extra: controller.cameras,
                  );
                },
                child: const Text(
                  "Camera Page",
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 3,
                color: Colors.green,
                onPressed: () {
                  router.push('/geolocation');
                },
                child: const Text(
                  "Geolocation Page",
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 3,
                color: Colors.green,
                onPressed: () {
                  router.push('/websocketpage');
                },
                child: const Text(
                  "Web Socket Page",
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 3,
                color: Colors.green,
                onPressed: () {
                  router.push('/printpdfpage');
                },
                child: const Text(
                  "Print Page",
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
