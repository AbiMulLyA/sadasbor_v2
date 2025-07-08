import 'package:flutter/material.dart';
class HistoryItem {
  final String jamDatang;
  final String tanggal;
  final String statusDatang;
  final bool tepatWaktuDatang;

  final String jamPulang;
  final String statusPulang;
  final bool tepatWaktuPulang; // True if on time or longer, false if pulang cepat etc.

  HistoryItem({
    required this.jamDatang,
    required this.tanggal,
    required this.statusDatang,
    required this.tepatWaktuDatang,
    required this.jamPulang,
    required this.statusPulang,
    required this.tepatWaktuPulang,
  });
}

class PresensiCardComponent extends StatelessWidget {
  const PresensiCardComponent({Key? key, required this.item, required this.onTap}) : super(key: key);

  final HistoryItem item;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {

    final subTextStyle = TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12);
    final mainTimeStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87);
    // Updated dateStyle from previous step
    final dateStyle = TextStyle(color: Colors.blueGrey[700], fontSize: 13, fontWeight: FontWeight.bold);
    // Updated dummy data for list
    Widget buildStatusDisplay(String status, bool isTepatWaktu) {
      IconData statusIconData = isTepatWaktu ? Icons.check_circle_outline : Icons.highlight_off;
      Color statusColor = isTepatWaktu ? Colors.green.shade700 : Colors.red.shade700;
      Color backgroundColor = isTepatWaktu ? Colors.green.shade50 : Colors.red.shade50;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(statusIconData, color: statusColor, size: 14),
            const SizedBox(width: 5),
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
    }



    return Card(
      color: Colors.white,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Split Vertical Color Bar
              Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 7.0,
                      color: item.tepatWaktuDatang ? Colors.green.shade400 : Colors.red.shade400,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 7.0,
                      color: item.tepatWaktuPulang ? Colors.green.shade400 : Colors.red.shade400,
                    ),
                  ),
                ],
              ),
              // Konten Utama Kartu
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // BAGIAN ATAS (Tanggal & Datang)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Row untuk Tanggal dengan ikon
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 14, color: dateStyle.color),
                                const SizedBox(width: 6),
                                Text(item.tanggal, style: dateStyle),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Datang", style: subTextStyle),
                                    const SizedBox(height: 3),
                                    Text(item.jamDatang, style: mainTimeStyle),
                                  ],
                                ),
                                buildStatusDisplay(item.statusDatang, item.tepatWaktuDatang),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey[300], thickness: 1.0, height: 1.0),
                      // BAGIAN BAWAH (Pulang)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Pulang", style: subTextStyle),
                                    const SizedBox(height: 3),
                                    Text(item.jamPulang, style: mainTimeStyle),
                                  ],
                                ),
                                buildStatusDisplay(item.statusPulang, item.tepatWaktuPulang),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
