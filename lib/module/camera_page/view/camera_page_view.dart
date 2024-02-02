import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';

class CameraPageView extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPageView({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  Widget build(context, CameraPageController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "This is the camera page",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.camera_alt,
                size: 100,
              ),
              FutureBuilder<void>(
                future: controller.initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 1 / 1,
                                child:
                                    CameraPreview(controller.cameraController),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                            onPressed: () {
                              controller.cameraController.dispose();
                            },
                            child: const Text("Close")),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CameraPageView> createState() => CameraPageController();
}
