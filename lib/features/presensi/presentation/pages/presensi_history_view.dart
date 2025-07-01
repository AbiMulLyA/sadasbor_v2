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
    final mainTimeStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
    final dateStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87);

    Widget buildStatusChip(String status, bool isTepatWaktu) {
      return Chip(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        label: Text(
          status,
          style: TextStyle(
            color: isTepatWaktu ? Colors.green[700] : Colors.red[700],
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
        backgroundColor: isTepatWaktu ? Colors.green[100] : Colors.red[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isTepatWaktu ? Colors.green[200]! : Colors.red[200]!,
            width: 1
          ),
        ),
        labelPadding: EdgeInsets.zero, // Remove default padding if any
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // To make chip smaller
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Agar Column hanya setinggi kontennya
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
                    color: Colors.blue, // Menggunakan warna primer tema
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // List Card (Maksimal 3)
          ListView.separated(
            itemCount: historyList.length > 3 ? 3 : historyList.length, // Batasi maksimal 3 item
            shrinkWrap: true, // Agar ListView menyesuaikan dengan kontennya di dalam Column
            physics: const NeverScrollableScrollPhysics(), // Non-scrollable karena sudah di dalam Column
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = historyList[index];
              return Card(
                color: Colors.white,
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      // Row Datang
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible( // Untuk fleksibilitas
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Datang", style: subTextStyle),
                                const SizedBox(height: 2),
                                Text(item.jamDatang, style: mainTimeStyle),
                              ],
                            ),
                          ),
                          Flexible( // Untuk fleksibilitas
                            child: Text(
                              item.tanggal,
                              style: dateStyle,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(color: Colors.grey[200], thickness: 1.5,),
                      const SizedBox(height: 10),
                      // Row Pulang
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible( // Untuk fleksibilitas
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Pulang", style: subTextStyle),
                                const SizedBox(height: 2),
                                Text(item.jamPulang, style: mainTimeStyle),
                              ],
                            ),
                          ),
                          Flexible( // Untuk fleksibilitas
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: buildStatusChip(item.statusKehadiran, item.tepatWaktu)
                            )
                          ),
                        ],
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
