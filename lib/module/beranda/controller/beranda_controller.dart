import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';

class BerandaController extends State<BerandaView> {
  static late BerandaController instance;
  late BerandaView view;

  late List<CameraDescription> cameras;

  void checkCamera() async {
    List<CameraDescription> camerasAvailable = await availableCameras();
    cameras = camerasAvailable;
    update();
  }

  @override
  void initState() {
    instance = this;
    super.initState();
    checkCamera();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
