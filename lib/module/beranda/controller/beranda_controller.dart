import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class BerandaController extends State<BerandaView> {
  static late BerandaController instance;
  late BerandaView view;

  late List<CameraDescription> cameras;

  checkPermission() async {
    var status = await Permission.camera.request();

    if (status.isDenied) {
      status = await Permission.camera.request();
      update();
      if (status != PermissionStatus.granted) {
        status = await Permission.camera.request();
      } else {
        checkCamera();
      }
    }
    if (status.isGranted) {
      checkCamera();
    }
  }

  void checkCamera() async {
    List<CameraDescription> camerasAvailable = await availableCameras();
    cameras = camerasAvailable;
    update();
  }

  checkPermissionGps() async {
    var status = await Permission.location.request();

    if (status.isDenied) {
      status = await Permission.location.request();
      update();
      if (status != PermissionStatus.granted) {
        status = await Permission.location.request();
      } else {
        handlePermission();
      }
    }
    if (status.isGranted) {
      handlePermission();
    }
  }

  final GeolocatorPlatform geolocatorAndroid = GeolocatorPlatform.instance;

  Future<bool> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await geolocatorAndroid.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await geolocatorAndroid.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorAndroid.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await geolocatorAndroid.openAppSettings();
      return false;
    }

    return true;
  }

  @override
  void initState() {
    instance = this;
    super.initState();
    checkPermission();
    checkPermissionGps();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
