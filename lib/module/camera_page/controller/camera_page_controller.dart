import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';

class CameraPageController extends State<CameraPageView> {
  static late CameraPageController instance;
  late CameraPageView view;

  late CameraController cameraController;
  late Future<void> initializeControllerFuture;

  initCamera() {
    cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            showAboutDialog(
                context: context, applicationName: e.code.toString());

            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    initializeControllerFuture = cameraController.initialize();
    update();
  }

  @override
  void initState() {
    instance = this;
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
