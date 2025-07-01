import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Dummy data model untuk representasi item histori
class HistoryItem {
  final String jamDatang;
  final String tanggal;
  final String jamPulang;
  final String statusKehadiran; // Bisa "Tepat Waktu" atau "Terlambat"
  final bool tepatWaktu;

  HistoryItem({
    required this.jamDatang,
    required this.tanggal,
    required this.jamPulang,
    required this.statusKehadiran,
    required this.tepatWaktu,
  });
}

class PresensiHistoryView extends HookWidget {
  const PresensiHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Dummy data untuk list, maksimal 3 item
    final List<HistoryItem> historyList = [
      HistoryItem(
          jamDatang: "07:28:23 WIB",
          tanggal: "Senin, 30 Juni 2025",
          jamPulang: "15:30:23 WIB",
          statusKehadiran: "Tepat Waktu",
          tepatWaktu: true),
      HistoryItem(
          jamDatang: "08:15:10 WIB",
          tanggal: "Selasa, 01 Juli 2025",
          jamPulang: "17:05:50 WIB",
          statusKehadiran: "Terlambat",
          tepatWaktu: false),
      HistoryItem(
          jamDatang: "07:55:00 WIB",
          tanggal: "Rabu, 02 Juli 2025",
          jamPulang: "16:00:00 WIB",
          statusKehadiran: "Tepat Waktu",
          tepatWaktu: true),
    ];

    final subTextStyle = TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12);
    final mainTimeStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87);
    final dateStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54);

    // Widget baru untuk menampilkan status dengan lebih jelas
    Widget buildStatusDisplay(String status, bool isTepatWaktu) {
      IconData statusIconData = isTepatWaktu ? Icons.check_circle_outline : Icons.highlight_off;
      Color statusColor = isTepatWaktu ? Colors.green.shade700 : Colors.red.shade700;
      Color backgroundColor = isTepatWaktu ? Colors.green.shade50 : Colors.red.shade50;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(statusIconData, color: statusColor, size: 16),
            const SizedBox(width: 6),
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 11,
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
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Riwayat Presensi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  // TODO: Navigasi ke halaman "Lihat Semua" riwayat
                  print("Lihat Semua diklik");
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // List Card (Maksimal 3)
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Bilah Warna Vertikal
                      Container(
                        width: 7.0,
                        color: item.tepatWaktu ? Colors.green.shade400 : Colors.red.shade400,
                      ),
                      // Konten Utama Kartu
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // ROW: DATANG (Kiri) & TANGGAL (Kanan)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start, // Agar align dengan "Datang"
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Datang", style: subTextStyle),
                                      const SizedBox(height: 3),
                                      Text(item.jamDatang, style: mainTimeStyle),
                                    ],
                                  ),
                                  Text(
                                    item.tanggal,
                                    style: dateStyle,
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // ROW: DIVIDER (Expanded) & STATUS
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1.0,
                                      color: Colors.grey[300],
                                      margin: const EdgeInsets.only(right: 8.0), // Jarak ke status
                                    ),
                                  ),
                                  buildStatusDisplay(item.statusKehadiran, item.tepatWaktu),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // PULANG
                              Text("Pulang", style: subTextStyle),
                              const SizedBox(height: 3),
                              Text(item.jamPulang, style: mainTimeStyle),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ),
                    ],
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
