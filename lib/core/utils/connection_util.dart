import 'dart:async'; //For StreamController/Stream
import 'dart:io'; //InternetAddress utility

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ConnectionUtil {
  // This tracks the current connection status
  bool hasConnection = false;

  // This is how we'll allow subscribing to connection changes
  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  // flutter_connectivity
  final Connectivity _connectivity = Connectivity();

  // Hook into flutter_connectivity's Stream to listen for changes
  // And check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen((results) {
      if (results.isNotEmpty) {
        _connectionChange(results);
      }
    });
    checkConnection();
  }

  Stream<bool> get connectionChange => connectionChangeController.stream;

  // A clean up method to close our StreamController
  // Because this is meant to exist through the entire application life cycle this isn't
  // really an issue
  void dispose() {
    connectionChangeController.close();
  }

  // flutter_connectivity's listener
  void _connectionChange(List<ConnectivityResult> results) {
    checkConnection(conRes: results);
  }

  // The test to actually see if there is a connection
  Future<bool> checkConnection({List<ConnectivityResult>? conRes}) async {
    final bool previousConnection = hasConnection;

    if (conRes != null && conRes.contains(ConnectivityResult.none)) {
      hasConnection = false;
    } else {
      try {
        final result = await InternetAddress.lookup('www.google.co.id');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          hasConnection = true;
        } else {
          hasConnection = false;
        }
      } on SocketException catch (_) {
        hasConnection = false;
      }
    }

    // The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    debugPrint('hasConnectionCheck: $hasConnection');
    return hasConnection;
  }

  void connectionInfo(bool hasConnection) {
    debugPrint('hasConnectionMain: $hasConnection');

    if (!hasConnection) {
      Fluttertoast.showToast(
        msg: 'Tidak ada internet',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Terhubung ke internet',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }
}
