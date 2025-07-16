import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/config/router/router.dart';

class PresensiInOutView extends HookWidget {
  const PresensiInOutView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for display, you'll replace this with actual data later
    const String jamMasuk = "07:28:23";
    const String jamKeluar = "--:--:--";

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );

    const labelTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    const timeTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    const timeTextStyleDisabled = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.grey[300]!, width: 1.0),
      ),
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Datang",
                    textAlign: TextAlign.center,
                    style: labelTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Pulang",
                    textAlign: TextAlign.center,
                    style: labelTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.grey[400], thickness: 0.8),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    jamMasuk,
                    textAlign: TextAlign.center,
                    style: timeTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    jamKeluar,
                    textAlign: TextAlign.center,
                    style: timeTextStyleDisabled,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: const Text(
                      "Absen Datang",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // TODO: Logika untuk Clock In
                      print("Clock In tapped");
                      context.pushRoute(
                        PresensiWriteAttendanceRoute(title: 'Jam Masuk'),
                      );
                    },
                    style: buttonStyle,
                  ),
                ),
                const SizedBox(width: 16),
/*                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.logout),
                    label: const Text(
                      "Absen Pulang",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // TODO: Logika untuk Clock Out
                      print("Clock Out tapped");
                      context.pushRoute(
                        PresensiWriteAttendanceRoute(title: 'Jam Pulang'),
                      );
                    },
                    style: buttonStyle,
                  ),
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
