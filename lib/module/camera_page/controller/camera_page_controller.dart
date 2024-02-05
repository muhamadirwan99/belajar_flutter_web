import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPageController extends State<CameraPageView> {
  static late CameraPageController instance;
  late CameraPageView view;

  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;

  bool hasCamera = false;

  checkPermission() async {
    var status = await Permission.camera.request();

    if (status.isDenied) {
      status = await Permission.camera.request();
      update();
      if (status != PermissionStatus.granted) {
        status = await Permission.camera.request();
      } else {
        await checkCamera();
        await initCamera();
      }
    }
    if (status.isGranted) {
      await initCamera();
    }
  }

  checkCamera() async {
    List<CameraDescription> camerasAvailable = await availableCameras();
    cameras = camerasAvailable;
    update();
  }

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
              context: context,
              applicationName: e.code.toString(),
            );
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
    if (widget.cameras.isEmpty) {
      hasCamera = false;
      checkPermission();
      update();
    } else {
      hasCamera = true;
      initCamera();
      update();
    }
    super.initState();
    checkPermission();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
