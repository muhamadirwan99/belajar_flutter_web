import 'dart:async';

import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationController extends State<GeolocationView> {
  static late GeolocationController instance;
  late GeolocationView view;

  final GeolocatorPlatform geolocatorAndroid = GeolocatorPlatform.instance;

  String latitude = "";
  String longitude = "";

  Future<bool> _handlePermission() async {
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
      getLocation();
      return false;
    }

    return true;
  }

  getLocation() async {
    try {
      final hasPermission = await _handlePermission();

      if (!hasPermission) {
        return;
      }

      final position = await geolocatorAndroid.getCurrentPosition();
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      update();
    } catch (e) {
      print(e);
      showAboutDialog(context: context, applicationName: "${e.toString()}");
    }
  }

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
