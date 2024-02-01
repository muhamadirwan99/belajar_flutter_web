import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import '../controller/geolocation_controller.dart';

class GeolocationView extends StatefulWidget {
  const GeolocationView({Key? key}) : super(key: key);

  Widget build(context, GeolocationController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocation"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Latitude : ${controller.latitude} Longitude : ${controller.longitude}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              MaterialButton(
                onPressed: () {
                  controller.latitude.trim().isEmpty
                      ? controller.getLocation()
                      : {
                          controller.latitude = "",
                          controller.longitude = "",
                          controller.update()
                        };
                },
                child: Text(
                  controller.latitude.trim().isEmpty
                      ? "Get Location"
                      : "Reset Location",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<GeolocationView> createState() => GeolocationController();
}
