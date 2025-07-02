import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/config/router/router.dart';

// Updated data model
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

class PresensiHistoryView extends HookWidget {
  const PresensiHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Updated dummy data for list
    final List<HistoryItem> historyList = [
      HistoryItem(
        jamDatang: "07:28:23 WIB",
        tanggal: "Senin, 30 Juni 2025",
        statusDatang: "Tepat Waktu",
        tepatWaktuDatang: true,
        jamPulang: "15:30:23 WIB",
        statusPulang: "Sesuai Jadwal",
        tepatWaktuPulang: true,
      ),
      HistoryItem(
        jamDatang: "08:15:10 WIB",
        tanggal: "Selasa, 01 Juli 2025",
        statusDatang: "Terlambat",
        tepatWaktuDatang: false,
        jamPulang: "17:05:50 WIB",
        statusPulang: "Lembur", // Example of another status for pulang
        tepatWaktuPulang: true, // Assuming lembur is also "good" or "green"
      ),
      HistoryItem(
        jamDatang: "07:55:00 WIB",
        tanggal: "Rabu, 02 Juli 2025",
        statusDatang: "Tepat Waktu",
        tepatWaktuDatang: true,
        jamPulang: "14:00:00 WIB",
        statusPulang: "Pulang Cepat",
        tepatWaktuPulang: false,
      ),
    ];

    final subTextStyle = TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12);
    final mainTimeStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87);
    // Updated dateStyle from previous step
    final dateStyle = TextStyle(color: Colors.blueGrey[700], fontSize: 13, fontWeight: FontWeight.bold);


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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Riwayat Presensi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              InkWell(
                onTap: () {
                  print("Lihat Semua diklik");
                  context.pushRoute(PresensiAllPresensiRoute());
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.separated(
            itemCount: historyList.length > 3 ? 3 : historyList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = historyList[index];
              return Card(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: (){
                    context.pushRoute(PresensiDetailRoute());
                  },
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
            },
          ),
        ],
      ),
    );
  }
}
