import 'dart:async';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_web/core.dart';
import '../view/web_socket_view.dart';

class WebSocketController extends State<WebSocketView> {
  static late WebSocketController instance;
  late WebSocketView view;

  String noPol = "F FEQ2899";
  String kdPlat = "1";

  PusherChannelsClient client = PusherChannelsClient.websocket(
    options: const PusherChannelsOptions.fromHost(
      scheme: 'ws',
      key: 'app-key',
      host: "192.168.99.14",
      port: 6001,
    ),
    connectionErrorHandler: (exception, trace, refresh) async {
      refresh();
    },
  );

  connectWS() {
    //DELETE WHEN PRODUCTION
    PusherChannelsPackageLogger.enableLogs();
    //=========================

    PublicChannel myPublicChannel = client.publicChannel(
      'callback${noPol.replaceAll(" ", "_")}_$kdPlat',
    );

    final StreamSubscription connectionSubs =
        client.onConnectionEstablished.listen((_) {
      myPublicChannel.subscribeIfNotUnsubscribed();
    });

    client.connect();
  }

  receiveResponse() {
    client.eventStream.listen((event) {
      dynamic data = event.tryGetDataAsMap();

      print("data");
      print(data);
      if (data != null) {
        if (data["data"] != null) {
          if (data["data"]["success"]) {
            showAboutDialog(
              context: context,
              applicationName:
                  "${data["data"]["message"]} - ${data["data"]["success"]}",
            );
          } else {
            showAboutDialog(
              context: context,
              applicationName:
                  "${data["data"]["message"]} - ${data["data"]["success"]}",
            );
          }
        }
      }
    });
  }

  @override
  void initState() {
    instance = this;
    super.initState();
    connectWS();
    receiveResponse();
  }

  @override
  void dispose() {
    super.dispose();
    client.disconnect();
    client.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
